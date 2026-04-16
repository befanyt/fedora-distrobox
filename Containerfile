FROM quay.io/fedora/fedora-toolbox:43@sha256:7458ba5d0a2448073c6345acd590d01a665ca6e45754cf4bb6f19eace4217c11

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
