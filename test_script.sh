# install go
cd Downloads;
wget https://go.dev/dl/go1.18.2.linux-amd64.tar.gz;
tar -xzvf go1.18.2.linux-amd64.tar.gz;
sudo mv go /usr/local;
export PATH=$PATH:/usr/local/go/bin;

# to let make command work
sudo apt-get install build-essential

#install TSBS from go root directory
go get github.com/timescale/tsbs
cd $GOPATH/src/github.com/timescale/tsbs
make

# executables of TSBS
export PATH=$PATH:/home/rasulrakhim/go/src/github.com/timescale/tsbs/bin

# generate data
tsbs_generate_data --use-case="iot" --seed=123 --scale=40 \
>     --timestamp-start="2016-01-01T00:00:00Z" \
>     --timestamp-end="2016-01-04T00:00:00Z" \
>     --log-interval="10s" --format="timescaledb" \
>       /tmp/timescaledb-data

# execute
cat /tmp/timescaledb-data.gz | gunzip | tsbs_load_influx \
--host="34.88.79.241" --port=8086 --pass="admin" \
--user="admin" --admin-db-name=defaultdb --workers=8  \
--in-table-partition-tag=false --chunk-time=8h --write-profile= \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false


tsbs_load_timescaledb  --postgres="sslmode=require" --host="10.166.0.8" --port=8086 --pass="password" \
--user="benchmarkuser" --admin-db-name=defaultdb --workers=8  \
--in-table-partition-tag=true --chunk-time=8h --write-profile= \
--field-index-count=1 --do-create-db=true --force-text-format=false \
--do-abort-on-exist=false

 tsbs_generate_data --use-case="iot" --seed=123 --scale=40 \
    --timestamp-start="2016-01-01T00:00:00Z" \
    --timestamp-end="2016-01-04T00:00:00Z" \
    --log-interval="10s" --format="influx" \
    | gzip > /tmp/timescaledb-data.gz

go env -w GO111MODULE=auto
sudo apt install git
go get github.com/timescale/tsbs;

cat /tmp/timescaledb-data.gz | gunzip | tsbs_load_influx \
--urls="http://10.166.0.13:8086"  \
--db-name=defaultdb1

time,per. metric/s,metric total,overall metric/s,per. row/s,row total,overall row/s
1654158000,355863.92,3.558710E+06,355863.92,44999.10,4.500000E+05,44999.10
1654158010,331987.08,6.878863E+06,343925.11,41996.43,8.700000E+05,43497.72
1654158020,324179.81,1.012056E+07,337343.70,41001.22,1.280000E+06,42665.60
1654158030,316313.91,1.328368E+07,332086.38,40000.29,1.680000E+06,41999.29
[worker 0] backoffs took a total of 0.000000sec of runtime

Summary:
loaded 14759004 metrics in 44.572sec with 1 workers (mean rate 331127.99 metrics/sec)
loaded 1866698 rows in 44.572sec with 1 workers (mean rate 41880.60 rows/sec)