
git clone --branch v3.12.3 https://github.com/protocolbuffers/protobuf libraries/protobuf
cd libraries/protobuf
./autogen.sh
./configure --prefix=$PWD/protobuf-host
make -j16
make install
cp ../once.h protobuf-host/include/google/protobuf/stubs/once.h
