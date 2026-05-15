FROM quay.io/fedora/fedora-toolbox:43@sha256:94bf63c39c65fa1437a6485b4a595d3fd53d46eafced7861b8eb0ea2692e0149

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
