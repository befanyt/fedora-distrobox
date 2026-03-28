FROM quay.io/fedora/fedora-toolbox:43@sha256:8c286329682b7f250869c3102cebc161461b863f48f0cde96e3efcd79dd26a39

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
