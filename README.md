# CHATON-primary
Primary outcome analysis for the CHATON trial

## Description

This repository includes R code to run all of the analysis for the paper:

Sie et al. (2024) Azithromycin during Routine Well-Infant Visits to Prevent Death. _New England Journal of Medicine_ 390:221-229 https://www.nejm.org/doi/full/10.1056/NEJMoa2309495

This work was funded by the Bill & Melinda Gates Foundation (grant OPP1187628), and was registered under clinical trial [NCT03676764](https://clinicaltrials.gov/study/NCT03676764)

Should you have any questions about the files in this repository, please contact Ben Arnold at UCSF (ben.arnold@ucsf.edu) or the corresponding author for the paper.

## Linked Repositories and Additional Resources

### Open Science Framework

This GitHub repository is mirrored on the Open Science Framework (OSF).  The OSF project page includes additional study-related resources, including the compiled HTML computational notebooks created from the `.Rmd` files, and the final analysis datasets.

[https://osf.io/s6h8n/](https://osf.io/s6h8n/)

## Software Information

Following: https://www.nature.com/documents/nr-software-policy.pdf

### System Requirements

All analyses were run using R software version 4.3.2 on macOS Monterey using the RStudio IDE (https://www.rstudio.com).

`> sessionInfo()`

`R version 4.3.2 (2023-10-31)`

`Platform: aarch64-apple-darwin20 (64-bit)`

`Running under: macOS Monterey 12.6`

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

You can do this by opening the R project file ([CHATON-primary.Rproj](https://github.com/proctor-ucsf/CHATON-primary/blob/main/CHATON-primary.Rproj)) in RStudio, loading the `renv` package, and typing `renv::restore()` to restore the package environment from the projects [renv.lock](https://github.com/proctor-ucsf/CHATON-primary/blob/main/renv.lock) file. 

3. All of the analysis scripts should run smoothly (scripts `1-xx.Rmd` to `11-xx.Rmd`) EXCEPT for `8-CHATON-Trial-Population.Rmd`, which does a quick comparison of population characteristics with the sister trial named CHAT, and relies on a child ID link that is not based on the public IDs.  All other scripts will run smoothly. They will save HTML file output in the /output directory.

### Installation Guide and Instructions for Use (Docker / RStudio Server)

The repository includes a `Dockerfile` and archive of package versions in the `renv.lock` file that you can use to build a Docker image and then launch a container on RStudio Server. 

You can download and install Docker from: https://docs.docker.com/get-docker/

For MacOS users, we also recommend installing Homebrew to ensure git and docker work smoothly: https://docs.brew.sh/Installation

After installing Docker and (optionally) homebrew, follow these steps:

1. Clone the GitHub repository to your computer, from the Terminal command line:

`git clone https://github.com/proctor-ucsf/CHATON-primary.git`

2. Build a Docker Image from the repository. 

For example, to create an image with the same name as the repository (but docker requires lowercase names), from the Terminal command line:

`docker build --tag chaton-primary  CHATON-primary/`

This will take about 25 minutes to build the image because it needs to download and install R and all of the relevant package libraries.

3. Launch an instance of the image on RStudio Server

There are many ways to do this, but one example of this, from the Terminal command line:

`docker run -e USER=myname -e PASSWORD=mypass --rm -p 8787:8787 -v /Users/benarnold/CHATON-primary:/home/ben chaton-primary`

This launches the container and passes (arbitrary) credentials to RStudio Server. In this example, the Username is `myname` and the Password is `mypass`. These could be anything you like -- you will just need to use them when you open your browser to access RStudio Server (next step)

4. Navigate to your web browser and go to: `http://localhost:8787`, then enter the USER and PASSWORD specified in the last step to access RStudio Server.

5. You can then run RStudio and the analysis files in a virtual instance of RStudio Server, just as you normally would on your desktop. Analyses will be run on the remote server using Linux-Ubuntu. All of the analysis scripts should run smoothly (scripts `1-xx.Rmd` to `11-xx.Rmd`) EXCEPT for `8-CHATON-Trial-Population.Rmd`, which does a quick comparison of population characteristics with the sister trial named CHAT, and relies on a child ID link that is not based on the public IDs.  All other scripts will run smoothly. They will save HTML file output in the `/output` directory.

NOTE: we have not tested the above steps on a Windows or Linux desktop operating system (only macOS Intel processors), but they should work similarly. We have not had a successful image build on Apple silicon processors for reasons that seem to be above the pay grade of an academic epidemiologist. If we figure it out, we will update the Dockerfile. 

### Additional details

You can run the `.Rmd` notebook scripts one-by-one or you can compile [`CHATON-primary-run-all.R`](https://github.com/proctor-ucsf/CHATON-primary/blob/main/R/CHATON-primary-run-all.R), which is the file we used to run the final analyses (e.g., from the command line `R CMD BATCH CHATON-primary-run-all.R &`).

The analyses on the above Mac desktop configuration with 8 cores required 14 minutes to run. 

Running the analysis on RStudio Server required 2 hours 36 minutes to complete.

### License

This project is covered by the CC0 1.0 Universal license.
