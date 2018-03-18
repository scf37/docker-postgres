PostgreSQL Image

Uses /data directory for moving parts, binds to localhost by default.
Cretes new database cluster files if data directory empty

Typical usage:
docker run -it --rm -v /data/postgres:/data --net=host scf37/postgres
