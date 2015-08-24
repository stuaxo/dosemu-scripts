#!/bin/bash

### WARNING - will remove ~/.dosemu directory


# debian

sudo apt-get purge -y dosemu

# compiled dosemu

sudo rm /usr/local/bin/dosemu.bin
sudo rm /usr/local/bin/dosdebug
sudo rm /usr/local/bin/dosemu
sudo rm -fR /usr/local/lib/dosemu*
sudo rm -fR /usr/local/share/dosemu

sudo ldconfig
hash -r

# remove local comfig
rm -fR ~/.dosemu

echo You might also want to run:
echo hash -r
echo sudo ldconfig
