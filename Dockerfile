FROM centos:7.3.1611
RUN yum -y install epel-release; yum clean all
RUN yum -y install python-pip; yum clean all && pip install --upgrade pip numpy scipy pandas scikit-learn tensorflow keras
