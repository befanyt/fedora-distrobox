FROM quay.io/fedora/fedora-toolbox:43@sha256:48f8f2e7ae64a5308ef0482499e0c38c0da5123e148cb5f4d819882a1e5fc6ba

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
