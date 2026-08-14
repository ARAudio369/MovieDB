import requests
import json
from azure.storage.blob import BlobServiceClient
import os


CONNECTION_STRING = os.getenv("MOVIEDB_AZURE_CONNECTION_STRING")
OUTPUT_CONTAINER = "bronze"
OUTPUT_DIRECTORY = "movies"
OUTPUT_FILENAME = 'movies.json'
blob_service_client = BlobServiceClient.from_connection_string(CONNECTION_STRING)
container_client = blob_service_client.get_container_client(OUTPUT_CONTAINER)
blob_path = f"{OUTPUT_DIRECTORY}/{OUTPUT_FILENAME}"
blob_client = container_client.get_blob_client(blob_path)


print("Bronze Ingestion started")

BASE_URL = 'https://api.themoviedb.org/3'
headers = {
    "Accept": "application/json",
    "Authorization":  f"Bearer {os.getenv('MOVIEDB_TMDB_TOKEN')}"
    }



def get_all_movies():
    movies = []

    page = 1
    total_pages = 1

    while page <= total_pages and len(movies) < 1000:       # while loop to limit the amount of entires ingested
        url = f"{BASE_URL}/discover/movie?page={page}"

        response = requests.get(url, headers=headers)
        data = response.json()

        movies.extend(data["results"])

        total_pages = data["total_pages"]
        page += 1

    return movies[:1000]

#Safety net to double-check movie limit (20 per page, 1000 total for now)
movies = get_all_movies()
print(len(movies))
print(movies[0])


def fetch_movie_details(movie_id):
    url = f"{BASE_URL}/movie/{movie_id}"

    response = requests.get(url, headers=headers)
    data = response.json()

    return data


    # Old function used to upload to local space
#def save_movies_to_blob(movies):
#    with open(OUTPUT_FILE, "w", encoding="utf-8") as outfile:
#        json.dump(movies, outfile, indent=4)

def save_movies_to_blob(movies):
    json_data = json.dumps(movies, indent=4)
    blob_client.upload_blob(json_data)

print(f"Uploaded {OUTPUT_FILENAME} to Azure Blob Storage")

def main():
    movies = get_all_movies()

    movie_details = []

    for movie in movies[:100]:
        details = fetch_movie_details(movie["id"])
        movie_details.append(details)

    save_movies_to_blob(movie_details)


if __name__ == "__main__":
    main()

