FROM quay.io/fedora/fedora-toolbox:43@sha256:19562733e865e239918685f34a8817dfdf14609986834dbfc5944d6c8b22baf6

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
