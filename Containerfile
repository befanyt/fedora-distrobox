FROM quay.io/fedora/fedora-toolbox:43@sha256:5d8a6fab84e97e8f99e0feb9ddccff460b7bc6e8d9d274b7dc0834aac0a0dd2c

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
