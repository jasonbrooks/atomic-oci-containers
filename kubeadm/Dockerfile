FROM centos:centos7
MAINTAINER "Jason Brooks" <jbrooks@redhat.com>

ENV container=docker

ENV NAME=kubeadm VERSION=0 RELEASE=0 ARCH=x86_64
LABEL BZComponent="$NAME" \
        Name="$FGC/$NAME" \
        Version="$VERSION" \
        Release="$RELEASE.$DISTTAG" \
        Architecture="$ARCH" \
        atomic.type='system'

COPY kubernetes.repo /etc/yum.repos.d/

RUN yum install -y docker kubelet kubeadm kubectl kubernetes-cni && yum clean all

LABEL RUN /usr/bin/docker run -d --privileged --net=host --pid=host -v /:/rootfs:ro -v /sys:/sys:rw -v /var/run:/var/run:rw -v /run:/run:rw -v /var/lib/docker:/var/lib/docker:rw -v /var/lib/kubelet:/var/lib/kubelet:slave -v /var/log/containers:/var/log/containers:rw

COPY launch.sh /usr/bin/

COPY tmpfiles.template service.template config.json.template /exports/

ENTRYPOINT ["/usr/bin/launch.sh"]
