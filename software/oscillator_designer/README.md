To design an oscillator:

Install QUCS. QUCS 0.0.20 built from source was used.

```
git clone https://github.com/zonca/python-qucs
cd python-qucs
sudo pip3 setup.py install
```

Make a new ramdisk to avoid burning cycles on your SSD (or running into latency issues on HDD).

```
sudo mount -t tmpfs -o size=100m tmpfs /mnt/qucs-tmpfs/
```

and set net_file, net_file_modified, and data_file to that tmpfs. Also set QUCSDIR to your qucs installation path.

Design a circuit in qucs, and set schematic_file to the schematic.

This could be accomplished equally well with scikit-rf.
