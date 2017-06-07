FROM registry.fedoraproject.org/fedora:rawhide
MAINTAINER "Jason Brooks" <jbrooks@redhat.com>

ENV container=docker

ENV NAME=kubeadm VERSION=0 RELEASE=0 ARCH=x86_64
LABEL BZComponent="$NAME" \
        Name="$FGC/$NAME" \
        Version="$VERSION" \
        Release="$RELEASE.$DISTTAG" \
        Architecture="$ARCH" \
        atomic.type='system'

RUN dnf update -y && dnf install -y docker kubernetes-node kubernetes-kubeadm kubernetes-client containernetworking-cni util-linux && dnf clean all 

LABEL RUN /usr/bin/docker run -d --privileged --net=host --pid=host -v /:/rootfs:ro -v /sys:/sys:rw -v /var/run:/var/run:rw -v /run:/run:rw -v /var/lib/docker:/var/lib/docker:rw -v /var/lib/kubelet:/var/lib/kubelet:slave -v /var/log/containers:/var/log/containers:rw

COPY launch.sh /usr/bin/

COPY tmpfiles.template service.template config.json.template /exports/

ENTRYPOINT ["/usr/bin/launch.sh"]
