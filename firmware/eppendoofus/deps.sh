

git clone --branch v3.12.3 https://github.com/protocolbuffers/protobuf libraries/protobuf
cd libraries/protobuf
./autogen.sh
./configure --prefix=$PWD/protobuf-host
make -j16
make install
#cp ../once.h protobuf-host/include/google/protobuf/stubs/once.h


export PKG_CONFIG_PATH=../protobuf/protobuf-host/lib/pkgconfig/
git clone --branch v1.3.3 https://github.com/protobuf-c/protobuf-c
cd protobuf-c
./autogen.sh
./configure --prefix=$PWD/protobuf-host
make -j16
make install

git clone https://github.com/PowerBroker2/SerialTransfer
