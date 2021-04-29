FROM registry.access.redhat.com/ubi7/ubi:7.6

RUN yum update -y && yum install -y unzip java-11-openjdk-headless && yum clean all

ARG ConnectorVersion=4.2.10
ARG ConnectorArchiveBase=couchbase-elasticsearch-connector-$ConnectorVersion
ARG ConnectorArchive=$ConnectorArchiveBase.zip
ARG ConnectorUrl=https://packages.couchbase.com/clients/connectors/elasticsearch/$ConnectorVersion/$ConnectorArchive

ENV CBES_HOME /opt/couchbase-elasticsearch-connector

ADD $ConnectorUrl /tmp
RUN cd /tmp && unzip -qo $ConnectorArchive && mv $ConnectorArchiveBase ${CBES_HOME} && rm $ConnectorArchive

COPY connector-config.toml ${CBES_HOME}/config/default-connector.toml

WORKDIR ${CBES_HOME}
RUN chown -R nobody:nobody . && chmod 777 -R .
USER nobody

#RUN sed -i 's/Root level="info"/Root level="trace"/' config/log4j2.xml
#RUN sed -i 's/level="warn"/level="trace"/' config/log4j2.xml

ENTRYPOINT ["bin/cbes"]
