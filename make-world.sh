#!/bin/bash

set -xe

function make_library() {
    echo "Making library $1"
    cd $1
    ./make.py
    ./runtests
    sudo ./make.py install
    sudo licant-libs .
    licant-libs . --user
    cd ..
}

make_library igris
make_library nos
make_library crow
make_library ralgo
make_library rabbit

cd onboardtest
bonesinger bonesinger.yaml
cd ..

make_library zillot
make_library genos

cd zippo
bonesinger bonesinger.yml
cd ..

cd gazebo-experiments
./make.sh
cd ..