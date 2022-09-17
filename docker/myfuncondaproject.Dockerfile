FROM continuumio/miniconda3:4.12.0
COPY docker/install-packages.sh .
RUN ./install-packages.sh

RUN conda update -n base -c defaults conda

RUN useradd --create-home appuser
WORKDIR /home/appuser
USER appuser
COPY test.py /home/appuser

COPY environment.yml .
RUN conda env create -n myfuncondaproject --file environment.yml && rm environment.yml

SHELL ["conda", "run", "-n", "myfuncondaproject", "/bin/bash", "-c"]

RUN conda init
RUN conda install -c pieri.liam myfuncondaproject

