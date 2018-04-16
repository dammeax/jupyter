FROM continuumio/anaconda3

RUN apt-get -y update
RUN apt-get -y install default-jre
RUN apt-get -y install python-pip
RUN pip install pixiedust jupyter_contrib_nbextensions jupyter_nbextensions_configurator
RUN curl -s http://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz | tar xz -C /opt
RUN ln -s /opt/spark-2.2.0-bin-hadoop2.7 /opt/spark
ADD inputPixiedustJupyterInstall.txt /tmp/
RUN jupyter pixiedust install < /tmp/inputPixiedustJupyterInstall.txt
RUN sed -i '/PYSPARK_SUBMIT_ARGS/d' ./kernel.json /root/.local/share/jupyter/kernels/pythonwithpixiedustspark22/kernel.json
RUN sed -i '/SPARK_DRIVER_MEMORY/d' ./kernel.json /root/.local/share/jupyter/kernels/pythonwithpixiedustspark22/kernel.json
RUN sed -i '/SPARK_LOCAL_IP/d' ./kernel.json /root/.local/share/jupyter/kernels/pythonwithpixiedustspark22/kernel.json
RUN jupyter contrib nbextension install
RUN jupyter nbextensions_configurator enable
WORKDIR /opt/spark
RUN cp /opt/spark/conf/spark-defaults.conf.template /opt/spark/conf/spark-defaults.conf
RUN echo 'spark.driver.extraJavaOptions=-Dhttp.proxyHost=http://proxy.lbs.alcatel-lucent.com -Dhttp.proxyPort=8000 -Dhttps.proxyHost=http://proxy.lbs.alcatel-lucent.com -Dhttps.proxyPort=8000' >> /opt/spark/conf/spark-defaults.conf
RUN echo 'spark.ui.reverseProxy true' >> /opt/spark/conf/spark-defaults.conf

# Jupyter config
COPY jupyter_notebook_config.json /root/.jupyter/

# Spark config
ENV SPARK_HOME /opt/spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip
ENV SPARK_OPTS --driver-java-options=-Xms1024M --driver-java-options=-Xmx4096M --driver-java-options=-Dlog4j.logLevel=info
