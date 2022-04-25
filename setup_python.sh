#!/bin/bash
# setup python
# execute things manually
brew install tcl-tk;
brew install pyenv-virtualenv;

pyenv install 3.7.12;
pyenv install 3.9.7;

pyenv global 3.7.12;
pip3 install ipykernel;

pyenv virtualenv 3.9.7 pydev;

# if this doesn't work restart shell
# ( eval "$(pyenv init -)" has to be added to .bashrc / .zshrc )
pyenv activate pydev;
pip install jupyterlab;
python -m ipykernel install --user;
pyenv deactivate;

# this sets which python versions to look for 
pyenv global pydev 3.7.12;

