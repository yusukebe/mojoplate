FROM perl:5.34

WORKDIR /app

RUN cpanm -n Carton

COPY cpanfile ./cpanfile
RUN carton install
