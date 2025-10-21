#!/bin/bash

mkdir -p src
mkdir -p include

if [ ! -f "src/main.cpp" ]; then
cat <<EOF > src/main.cpp
#include <iostream>

int main() {
    std::cout << "Hello world!" << std::endl;
    return 0;
}
EOF
echo "Created src/main.cpp"
else
    echo "src/main.cpp already exists — skipping."
fi

if [ ! -f "CMakeLists.txt" ]; then
cat <<EOF > CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project(MyProject)
set(CMAKE_CXX_STANDARD 17)

include_directories(include)
add_executable(MyProject src/main.cpp)
EOF
echo "Created CMakeLists.txt"
else
    echo "CMakeLists.txt already exists — skipping."
fi

