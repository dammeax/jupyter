FROM centos:7.3.1611
RUN yum -y install epel-release; yum clean all
RUN yum -y group install "Development Tools"
RUN yum -y install python27-python-devel.x86_64
RUN yum -y install python-pip; yum clean all && pip install --upgrade pip numpy scipy pandas scikit-learn tensorflow keras jupyter
