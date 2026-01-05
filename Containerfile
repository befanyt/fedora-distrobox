FROM quay.io/fedora/fedora-toolbox:43@sha256:a172128885fb26d98b9d78c11f4787f3584466c8bb5154081f80de749c58d8f3

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
