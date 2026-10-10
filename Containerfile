FROM quay.io/fedora/fedora-toolbox:43@sha256:b084ab9dc18a3d18572aa6478f7bf2a9f20ec1dea18d93a628d306b17b4209d1

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
