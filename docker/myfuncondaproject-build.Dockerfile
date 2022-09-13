FROM continuumio/miniconda3:4.12.0

RUN mkdir /app
WORKDIR /app
RUN conda update -n base -c defaults conda
COPY docker/install-packages.sh .
RUN ./install-packages.sh

COPY environment.yml .

RUN conda env create -n myfuncondaproject --file environment.yml

COPY bld.bat .
COPY build.sh .
COPY meta.yaml .
ADD myfuncondaproject myfuncondaproject
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "myfuncondaproject", "conda-build", "."]