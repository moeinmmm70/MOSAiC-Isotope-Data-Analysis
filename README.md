# **MOSAiC Isotope Data Analysis**
*A full end-to-end data engineering, analytics, and visualization workflow for Arctic water-isotope datasets (δ¹⁸O, δD, d-excess) collected during the MOSAiC CiASOM project.*

![Python](https://img.shields.io/badge/Python-3.10+-blue.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)

---

## 📘 **Project Overview**

This repository provides a **reproducible scientific data workflow** for the MOSAiC CiASOM water-isotope datasets, all of which are **officially published on PANGAEA**.  
It serves as a complete demonstration of:

- **Scientific data engineering** (cleaning, harmonization, validation)  
- **Metadata-compliant processing** aligned with Arctic research standards  
- **Exploratory & statistical analysis** in Python  
- **Geospatial visualization** of the MOSAiC drift track  
- **Structured SQL analytics** using PostgreSQL  
- Full **FAIR-compliant research workflow**, ready for reuse and reproducibility  

The structure of this project is aligned with professional analytics projects (e.g., your Citi Bike repository), but tailored to a scientific dataset.

---

## 📡 **Data Sources – PANGAEA DOIs**

All datasets processed in this repository are publicly available and citable:

https://doi.pangaea.de/10.1594/PANGAEA.945285

https://doi.pangaea.de/10.1594/PANGAEA.951448

https://doi.pangaea.de/10.1594/PANGAEA.951424

https://doi.pangaea.de/10.1594/PANGAEA.951447

https://doi.pangaea.de/10.1594/PANGAEA.951449

https://doi.pangaea.de/10.1594/PANGAEA.951446

https://doi.pangaea.de/10.1594/PANGAEA.958464

https://doi.pangaea.de/10.1594/PANGAEA.948511

https://doi.pangaea.de/10.1594/PANGAEA.971334

https://doi.pangaea.de/10.1594/PANGAEA.971330

https://doi.pangaea.de/10.1594/PANGAEA.958466

https://doi.pangaea.de/10.1594/PANGAEA.971337

https://doi.pangaea.de/10.1594/PANGAEA.971338

https://doi.pangaea.de/10.1594/PANGAEA.952556

https://doi.pangaea.de/10.1594/PANGAEA.971266

https://doi.pangaea.de/10.1594/PANGAEA.977801

https://doi.pangaea.de/10.1594/PANGAEA.966184

https://doi.pangaea.de/10.1594/PANGAEA.966225

https://doi.pangaea.de/10.1594/PANGAEA.966223

https://doi.pangaea.de/10.1594/PANGAEA.980514


The project uses **processed datasets only**, identical to the published PANGAEA versions.  
No raw restricted data are included in this repository.

---

## 📄 **Related Peer-Reviewed Publications**

The workflows and datasets in this repository support the following scientific publications:

- **Mellat et al. (2024, Preprint)**  
  https://www.researchsquare.com/article/rs-3572881/v1  

- **Mellat et al., Elementa (2024)**  
  https://online.ucpress.edu/elementa/article/13/1/00028/213073  

- **Mellat et al., Elementa (2023)**  
  https://online.ucpress.edu/elementa/article/12/1/00078/200046  

These articles provide the scientific interpretation; this repository provides the **code, analytics, and reproducibility framework** behind them.

---

## 📊 **Analysis Preview**

This repository contains clean, reproducible workflows for:

- Time-series variability of δ¹⁸O, δD, and d-excess  
- Meteorology–isotope interactions  
- Snow-pack structure and vertical fractionation  
- Vapor–snow–precipitation isotope comparisons  
- Geospatial mapping of the MOSAiC drift track  
- External Arctic precipitation dataset comparisons  

### **Key Notebooks**

| Notebook | Description |
|---------|-------------|
| `01_data_overview_CiASOM.ipynb` | Dataset structure, metadata validation, summary isotope statistics. |
| `02_time_series_MET_and_LHF.ipynb` | Temporal isotope variability vs. atmospheric variables. |
| `03_distributions_vapor_snow_precip.ipynb` | Seasonal isotope distributions across compartments. |
| `04_snow_profiles_and_structure.ipynb` | Snowpack structure, density, and vertical isotope gradients. |
| `05_geospatial_maps_MOSAiC_and_79N.ipynb` | Drift-track mapping using polar projections. |
| `06_external_precipitation_sites_comparison.ipynb` | Arctic-wide comparison with external precipitation datasets. |

---

## 📂 Repository Structure

- [`data/`](./data)
  - [`processed/`](./data/processed) — Cleaned datasets aligned with PANGAEA DOIs

- [`notebooks/`](./notebooks) — Main analysis and visualization workflows

- [`scripts/`](./scripts)
  - [`build_database_postgres.py`](./scripts/build_database_postgres.py) — Loads processed PANGAEA data into PostgreSQL
  - [`cleaning_utils.py`](./scripts/cleaning_utils.py) — Utility functions for data formatting

- [`sql/`](./sql) — SQL schema, QC queries, analytical queries

- [`docs/`](./docs) — Metadata documents, data dictionary, notes

- [`reports/`](./reports) — Exported figures and analytical summaries

- [`requirements.txt`](./requirements.txt) — Python package requirements  
- [`README.md`](./README.md)

---

## 🧠 **Project Goals**

This repository is designed to:

- Provide a fully **reproducible scientific workflow**  
- Make PANGAEA-published isotope datasets **immediately usable**  
- Showcase modern **Python & SQL data engineering** for scientific datasets  
- Support researchers in replicating or extending MOSAiC isotope analyses  
- Offer a high-quality, public portfolio project demonstrating your end-to-end skillset  

---

## 🛠️ **Tech Stack**

| Tool | Purpose |
|------|---------|
| Python | Data wrangling, metadata processing, analysis |
| Pandas / NumPy | Structured scientific data manipulation |
| Matplotlib / Seaborn / Plotly | Visualization |
| GeoPandas / Cartopy | Geospatial mapping & polar projections |
| PostgreSQL | Database storage & SQL analytics |
| JupyterLab | Notebook-driven analysis |
| PANGAEA | DOI-based scientific dataset archive |

---

## 🚀 **How to Use This Repository**

- Access processed data directly in `data/processed/`
- Run the notebooks to reproduce figures and analyses
- Use the `sql/` directory for database-based analytics
- Extend `scripts/` to build new pipelines or integrate new datasets
- Export figures for scientific papers, presentations, or teaching

---

## 📬 **Contact**

**Moein Mellat**  
PhD Hydrology & Geosciences  
GitHub: https://github.com/moeinmmm70  
LinkedIn: https://linkedin.com/in/moeinmmm70  

---

## 📜 **License**

- **Code:** MIT License  
- **Data:** Licensed according to each dataset’s PANGAEA DOI (primarily CC-BY).  

Please cite the PANGAEA DOIs and published papers when using the data.
