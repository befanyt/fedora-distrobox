FROM quay.io/fedora/fedora-toolbox:43@sha256:63b712813bc1c6e2ead7103acaa2f7f8a3d17a4f2ac1b9e184d0f1f01e6000c1

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
