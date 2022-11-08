# install go
cd Downloads;
wget https://go.dev/dl/go1.18.2.linux-amd64.tar.gz;
tar -xzvf go1.18.2.linux-amd64.tar.gz;
sudo mv go /usr/local;
export PATH=$PATH:/usr/local/go/bin;



# to let make command work
sudo apt-get install build-essential;

# install TSBS
go env -w GO111MODULE=auto;
sudo apt install git;
go get github.com/timescale/tsbs;
cd /home/rasulrakhim/go/src/github.com/timescale/tsbs;
sudo apt-get install build-essential -y;
make;

# executables of TSBS
export PATH=$PATH:/home/rasulrakhim/go/src/github.com/timescale/tsbs/bin;