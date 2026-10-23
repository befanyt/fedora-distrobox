FROM quay.io/fedora/fedora-toolbox:46@sha256:2c8a6048963d9006e0d5d01399cb0817f073ccf2e181b97db300db29d1c57a3f

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
