FROM quay.io/fedora/fedora-toolbox:43@sha256:ad1ac7dc33c89c028cc08ebf3e671c97f041eb8621822cf6acb78b50eab63499

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
