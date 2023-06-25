###### uncomment the code below, you can use the latest verse
# ARG BASE_CONTAINER=rocker/verse:latest

# I fixed this image to use 4.04 based R
# https://hub.docker.com/layers/rocker/verse/4.0.4/images/sha256-c98bc2327babaef10deb3f0aad3eebe6fc981f0f835da6735cbd33c3468fd2b7?context=explore
ARG BASE_CONTAINER=rocker/verse:4.2.2
FROM $BASE_CONTAINER

# install r packages
RUN R -e "install.packages('tidyverse', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('data.table', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('psych', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('RWiener', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('see', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages(c('foreach', 'parallel', 'iterators', 'doParallel'), repos = 'http://cran.us.r-project.org')"
# RUN R -e "install.packages('cmdstanr', repos = c('https://mc-stan.org/r-packages/', getOption('repos')))"

# install r package from github
RUN R -e "install.packages('devtools', repos = 'http://cran.us.r-project.org')"
RUN R -e "devtools::install_github('hauselin/hausekeep')"
RUN R -e "devtools::install_github('yuki-961004/yukiSH')"
RUN R -e "devtools::install_github('yuki-961004/yukiBP@cdb5b0764438306aefe2687b7c1993a3e8059161')"

# RUN R -e "install.packages('tinytex', repos = 'http://cran.us.r-project.org')"
# RUN R -e "tinytex::install_tinytex()"
# RUN R -e "install.packages('papaja', repos = 'http://cran.us.r-project.org')"

# install cmdstanr
# RUN mkdir -p /home/rstudio/.cmdstanr
# ENV PATH="/home/rstudio/.cmdstanr:${PATH}"
# RUN R -e "cmdstanr::install_cmdstan(dir = '/home/rstudio/.cmdstanr', cores = 4)"

# install lib dependencies

# add data
# COPY /example/Script_example.Rmd /home/rstudio/example/
# COPY /example/Script_example.r /home/rstudio/example/
# COPY /example/df_example.csv /home/rstudio/example/
