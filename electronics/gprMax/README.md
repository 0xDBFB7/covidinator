Install the fork of gprMax:

```
Install miniconda
conda update conda
conda install git
git clone https://github.com/0xDBFB7/gprMax.git
cd gprMax
conda env create -f conda_env.yml
conda env activate gprMax
```


```

python3 setup.py build && python3 setup.py install
python3 tests/lumped_components/path_integral_test.py 
```
