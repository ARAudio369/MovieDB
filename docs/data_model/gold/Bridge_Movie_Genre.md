# Bridge: bridge_movie_genre

## Purpose

The `bridge_movie_genre` table resolves the many-to-many relationship between movies and genres within the MovieDB platform.

A single movie may have multiple genres, and a single genre will absolutely be associated with multiple movies.

The grain of this table is:

> One row per movie and genre relationship.

---

## Schema

| Column      | Description                         | Source / Transformation |
|---          |---                                  |---|
| `movie_key` | Foreign key referencing `dim_movie` | Generated during transformation |
| `genre_key` | Foreign key referencing `dim_genre` | Generated during transformation |

---

## Design Notes

### Many-to-Many Relationship

Movies cannot store genres directly as a single attribute because a movie may belong to multiple genres.

Example:

```
Movie: The Ring (2002)

Genres:
- Horror
- Science Fiction
- Thriler
```

The bridge table stores each relationship separately:

| movie_key | genre_key |
|---        |---|
| 101       | 1 |
| 101       | 5 |
| 101       | 8 |

This maintains a normalised dimensional model while allowing flexible analysis.

---

## Relationships

```
dim_movie
     |
     |
bridge_movie_genre
     |
     |
dim_genre
```