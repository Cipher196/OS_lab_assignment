#!/bin/bash


if command -v python3 > /dev/null; then
    py_version=$(python3 --version)

    if [[ $py_version == "Python 3.6"* ]]; then
        echo "Python 3.6 is already installed."
    else
        echo "Installing Python 3.6..."
        sudo apt-get install -y python3.6
    fi

else
    echo "Installing Python 3.6..."
    sudo apt-get install -y python3.6
fi

echo "Current Python Version:"
python3 --version


if ! command -v pip3 > /dev/null; then
    echo "Installing python3-pip..."
    sudo apt-get install -y python3-pip
fi

if python3 -c "import numpy" 2>/dev/null; then
    echo "NumPy is already installed."
    echo "Updating NumPy..."
    sudo pip3 install --upgrade numpy
else
    echo "Installing NumPy..."
    sudo pip3 install numpy
fi


