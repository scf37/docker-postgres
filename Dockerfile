FROM scf37/base:latest

ENV PSQL_VERSION=10.3-1
RUN groupadd -r postgres --gid=999 && useradd -r -g postgres --uid=999 postgres && \
    cd /opt && \
    wget -O /opt/pgsql.tar.gz https://get.enterprisedb.com/postgresql/postgresql-$PSQL_VERSION-linux-x64-binaries.tar.gz && \
    tar xf ./pgsql.tar.gz && \
    cp -r /opt/pgsql/bin /opt/pgsql/lib /opt/pgsql/share /opt && \
    rm -rf /opt/pgsql /opt/pgsql.tar.gz && \
    /sbin/ldconfig /opt/pgsql/lib

COPY run.sh /opt/run.sh
ENV PATH=$PATH:/opt/bin
ENTRYPOINT ["/opt/run.sh"]