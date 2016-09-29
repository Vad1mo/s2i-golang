
# golang-builder
FROM golang:1.7

# Put the maintainer name in the image metadata
MAINTAINER Javier Teso <jtejob@gmail.com>

# builder environment variable to inform users about application you provide them
ENV BUILDER_VERSION 1.0

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="Platform for building golang applications" \
      io.k8s.display-name="Golang 1.7 builder" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,golang,golang 1.7"

# TODO: Install required packages here:
# RUN yum install -y ... && yum clean all -y

# TODO (optional): Copy the builder files into /opt/app-root
# COPY ./<builder_folder>/ /opt/app-root/

# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image sets io.openshift.s2i.scripts-url label that way, or update that label
LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i

COPY ./.s2i/bin/ /usr/local/s2i

# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
#RUN chown -R 1001:1001 /opt/app-root
RUN useradd -ms /bin/bash default
RUN chown -R default:default /go

# This default user is created in the openshift/base-centos7 image
#USER 1001
USER default

# Set the default port for applications built using this image
EXPOSE 8080

# TODO: Set the default CMD for the image
CMD ["usage"]
