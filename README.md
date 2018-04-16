Project to create a docker image for Jupyter Notebook editor tailored for xp team.

Image is based on docker hub anaconda image.
Anaconda comes with th following packages installed:

https://docs.anaconda.com/anaconda/packages/py3.6_linux-64

On top of Anaconda installation the image contains:

* pixiedust
* jupyter_contrib_nbextensions
* jupyter_nbextensions_configurator

The file inputPixiedustJupyterInstall.txt is used to answer to interactie jupyter installation script of pixiedust.
Unfortunately, there is no way to install pixiedust without interactions. The only way found up to now is to provide answers via a text file (inputPixiedustJupyterInstall.txt)

Added value of Pixie dust:

* interactive visualization with different renderer (matplotlib, seaborn, bokeh)
* spark job monitor that let you visualize the spark tasks progress and details
* debbuger (https://medium.com/ibm-watson-data-lab/the-visual-python-debugger-for-jupyter-notebooks-youve-always-wanted-761713babc62)
