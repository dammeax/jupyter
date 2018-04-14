FROM centos:7.3.1611
RUN yum -y install epel-release; yum clean all
RUN yum -y group install "Development Tools"
RUN yum -y install install python-devel wget
ADD https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh /tmp/
RUN chmod 770 /tmp/Anaconda3-5.1.0-Linux-x86_64.sh
RUN /tmp/Anaconda3-5.1.0-Linux-x86_64.sh
