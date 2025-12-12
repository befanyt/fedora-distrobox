FROM quay.io/fedora/fedora-toolbox:43@sha256:42e37cbb2231d3fd8f3948d9d686a20ed62e713efe3fa5d8e8f3906933eed106

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
