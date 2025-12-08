FROM quay.io/fedora/fedora-toolbox:43@sha256:e548435071f76bddb347ea8f644192257c388a569ce576e54f6a8c0cfbc2519c

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
