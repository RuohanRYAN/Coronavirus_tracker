FROM continuumio/miniconda3

RUN apt-get update && apt-get install -y \
  gcc 
  
RUN git clone https://github.com/RuohanRYAN/Coronavirus_tracker

RUN conda install -c conda-forge yarn

RUN cd Coronavirus_tracker && yarn install

RUN pip install pandas

RUN pip install bokeh


EXPOSE 5006

WORKDIR Coronavirus_tracker

CMD ["bokeh", "serve", "--show", "resulting.py"]