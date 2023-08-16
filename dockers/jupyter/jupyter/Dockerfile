#imagen base
FROM jupyter/scipy-notebook

#copio el requirements
COPY ./requirements.txt /tmp/requirements.txt

#instalo los paquetes
RUN pip3 install -r /tmp/requirements.txt

#volumenes para guardar los notebooks
VOLUME /notebooks
WORKDIR /notebooks