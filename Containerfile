FROM quay.io/fedora/fedora-toolbox:43@sha256:2db53c1febb0a0307678f4144b266733fc2dd7a1df321d450e63c284de8541af

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
