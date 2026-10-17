FROM quay.io/fedora/fedora-toolbox:43@sha256:3bacc825d25c0eb29316fc5c3428fb86949e2e7c85416f7b9bb291de9bb500b0

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
