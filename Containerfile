FROM quay.io/fedora/fedora-toolbox:43@sha256:77fcdba1b54979561edaa5d85d23e251274e212af906b9ae7ddf79ba5c884ad4

RUN <<EORUN
set -euxo pipefail

sed -i "s/enabled=1/enabled=0/" "/etc/yum.repos.d/fedora-cisco-openh264.repo"

dnf -y install --setopt=install_weak_deps=False \
	dnf-plugins-core \
	pinentry

dnf -y install --setopt=install_weak_deps=False \
    just \
    btop

EORUN
