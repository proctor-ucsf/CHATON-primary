# CHATON-primary
Primary outcome analysis for the CHATON trial

## Description

This repository includes R code to run all of the analysis for the paper:

Sie et al. **zithromycin during Routine Well-Infant Visits to Prevent Death**. (_in press_)

This work was funded by the Bill & Melinda Gates Foundation (grant OPP1187628), and was registered under clinical trial [NCT03676764](https://clinicaltrials.gov/study/NCT03676764)

Should you have any questions about the files in this repository, please contact Ben Arnold at UCSF (ben.arnold@ucsf.edu) or the corresponding author for the paper.

## Linked Repositories and Additional Resources

### Open Science Framework

This GitHub repository is mirrored on the Open Science Framework (OSF).  The OSF project page includes additional study-related resources, including the compiled HTML computational notebooks created from the `.Rmd` files, and the final analysis datasets.

[https://osf.io/e6j5a/](https://osf.io/s6h8n/)

## Software Information

Following: https://www.nature.com/documents/nr-software-policy.pdf

### System Requirements

All analyses were run using R software version 4.3.0 on macOS Monterey using the RStudio IDE (https://www.rstudio.com).

`> sessionInfo()`

`R version 4.3.0 (2023-04-21)

`Platform: aarch64-apple-darwin20 (64-bit)

`Running under: macOS Monterey 12.6

(TBD) In this repository we have created a Docker container and have used the `renv` package to archive the package versions so that you and reproduce the exact compute environment on an instance of R Studio Server, should you wish to do so. 

### Installation Guide and Instructions for Use (Desktop)

You can download and install R from CRAN: https://cran.r-project.org

You can download and install RStudio from their website: https://www.rstudio.com

All R packages required to run the analyses are sourced in the file `0-CHATON-primary-Config.R`.

The installation time should be < 10 minutes total on a typical desktop computer.

To reproduce all analyses in the paper, we recommend that you: 

1. Clone the GitHub repository to your computer

For example, in the location on your computer where you would like to clone the repository, you could type into the Terminal command:

`git clone https://github.com/proctor-ucsf/CHATON-primary.git`

2. Recreate the exact package environment using the `renv` package. 

You can do this by opening the R project file ([CHATON-Primary-Analysis.Rproj](https://github.com/proctor-ucsf/CHATON-primary/blob/main/CHATON-Primary-Analysis.Rproj)) in RStudio, loading the `renv` package, and typing `renv::restore()` to restore the package environment from the projects [renv.lock](https://github.com/proctor-ucsf/CHATON-primary/blob/main/renv.lock) file. 

3. All of the analysis scripts should run smoothly (scripts `1-xx.Rmd` to `8-xx.Rmd`). 

### Installation Guide and Instructions for Use (Docker / RStudio Server)

The repository includes a `Dockerfile` and archive of package versions in the `renv.lock` file that you can use to build a Docker image and then launch a container on RStudio Server. 

You can download and install Docker from: https://docs.docker.com/get-docker/

For MacOS users, we also recommend installing Homebrew to ensure git and docker work smoothly: https://docs.brew.sh/Installation

After installing Docker and (optionally) homebrew, follow these steps:

1. Clone the GitHub repository to your computer, from the Terminal command line:

`git clone https://github.com/proctor-ucsf/CHATON-primary.git`

2. Build a Docker Image from the repository. 

For example, to create an image with the same name as the repository, from the Terminal command line:

`docker build -t CHATON-primary  CHATON-primary/`

This will take about 30 minutes to build the image because it needs to download and install R and all of the relevant package libraries.

3. Launch an instance of the image on RStudio Server

There are many ways to do this, but one example of this, from the Terminal command line:

`docker run -e USER=ben -e PASSWORD=pass --rm -p 8787:8787 -v /Users/benarnold/CHATON-primary:/home/ben CHATON-primary`

This launches the container and passes (arbitrary) credentials to RStudio Server. In this example, the Username is `ben` and the Password is `pass`. These could be anything you like -- you will just need to use them when you open your browser to access RStudio Server (next step)

4. Navigate to your web browser and go to: `http://localhost:8787`, then enter the USER and PASSWORD specified in the last step to access RStudio Server.

5. You can then run RStudio and the analysis files in a virtual instance of RStudio Server, just as you normally would on your desktop. Analyses will be run on the remote server using Linux-Ubuntu. All of the analysis scripts should run smoothly (scripts `1-xx.Rmd` to `9-xx.Rmd`). 

NOTE: we have not tested the above steps on a Windows or Linux desktop operating system (only macOS), but they should work similarly.

### Additional details

You can run the `.Rmd` notebook scripts one-by-one or you can compile [`CHATON-primary-run-all.R`](https://github.com/proctor-ucsf/CHATON-primary/blob/main/R/0-CHATON-primary-run-all.R), which is the file we used to run the final analyses (e.g., from the command line `R CMD BATCH CHATON-primary-run-all.R &`).

The analyses on the above Mac desktop configuration required 17 minutes to run. 

After building an image on RStudio Server, all data processing and analyses also required about 17 minutes to run.

### License

This project is covered by the CC0 1.0 Universal license.
