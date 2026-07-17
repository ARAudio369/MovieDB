# Architecture Decisions

## Azure Data Lake Storage Gen2 for Bronze Layer

Decision:
Raw TMDb API responses will be stored as JSON files in Azure Data Lake Storage Gen2.

Reason:

The Bronze layer should preserve source data in its original format. Keeping raw files allows historical reprocessing without requiring another API extraction. First use of Azure Data Lake Storage!

---

## Azure SQL Database for Analytical Models + Silver & Gold Layers 

Decision:

Silver and Gold datasets will be stored within Azure SQL Database.

Reason:

The project focuses on analytics engineering and dimensional modelling rather than large-scale distributed processing. Azure SQL provides a practical relational environment for BI workloads - this should be a familiar environment for this project.

---

## dbt for Transformations

Decision:

SQL transformations will be managed using dbt.

Reason:

dbt provides version-controlled SQL models, testing, documentation generation, and dependency management. The main driver for this project - using a new tool.