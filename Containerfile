FROM quay.io/fedora/fedora-toolbox:43@sha256:21a863e295023df02ca14c09f4406d2ade200ce3b3ce7022d3c2c390b9b18f7e

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
