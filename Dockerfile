FROM centos:7.3.1611
RUN yum -y install epel-release; yum clean all
RUN yum -y group install "Development Tools"
RUN yum -y install install python-devel wget
RUN wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-ppc64le.sh
RUN Anaconda3-5.1.0-Linux-ppc64le.sh
