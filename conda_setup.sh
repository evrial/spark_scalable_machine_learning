#!/usr/bin/env bash
sudo apt-get -qq update
sudo apt-get install -yqq linux-headers-generic
# reboot

# http://blog.prabeeshk.com/blog/2015/06/19/pyspark-notebook-with-docker/
# http://twiecki.github.io/blog/2014/11/18/python-for-data-science/

# http://conda.pydata.org/miniconda.html
# http://conda.pydata.org/docs/install/quick.html
echo "Installing Miniconda"
wget -P /tmp https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86.sh
bash /tmp/Miniconda-latest-Linux-x86.sh; rm /tmp/Miniconda-latest-Linux-x86.sh

echo "installing Scipy stack"
# https://github.com/jakevdp/sklearn_pycon2015
conda install --yes numpy scipy matplotlib scikit-learn ipython-notebook seaborn
# conda install anaconda
# http://conda.pydata.org/docs/install/tab-completion.html

# http://bikulov.org/blog/2014/05/14/install-up-to-date-scientific-environment-in-ubuntu-14-dot-04-with-python-3-dot-4/
# https://github.com/jeff1evesque/machine-learning#linux-packages


echo "c.NotebookApp.notebook_dir = u'/vagrant'" >> ~/.ipython/profile_pyspark/ipython_notebook_config.py

# patch PATH of notebook upstart job config 17 line:
sudo sed -i '17s|.*|env PATH=/home/vagrant/miniconda/bin/:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/bin/spark-1.3.1-bin-hadoop2.6/bin|' /etc/init/notebook.conf

sudo initctl reload notebook
sudo service notebook restart
