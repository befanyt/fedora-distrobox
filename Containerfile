FROM quay.io/fedora/fedora-toolbox:43@sha256:b6596807c55302a99673f4fd0e15fa78a8b3f22709e6dd5bd4b0f4fdb1d2f67f

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
