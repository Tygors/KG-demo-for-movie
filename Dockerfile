FROM python:3.6

RUN apt-get update
RUN apt-get -y install default-jdk

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 STREAMLIT_SERVER_PORT=80 FUSEKI_HOME=/kbqa/jena/apache-jena-fuseki-3.5.0

ADD . /kbqa

WORKDIR /kbqa

RUN pip install --no-cache-dir -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple

RUN /kbqa/jena/apache-jena-3.5.0/bin/tdbloader --loc="/kbqa/jena/tdb" "/kbqa/kg_demo_movie.nt"

EXPOSE 80

CMD ["./start.sh"]