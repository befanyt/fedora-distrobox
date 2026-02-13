FROM quay.io/fedora/fedora-toolbox:43@sha256:bcf8f25c21b24ec24e3e7fe04040a2c081d14f460306bfd1664e70a8a8812c77

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
