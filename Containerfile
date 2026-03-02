FROM quay.io/fedora/fedora-toolbox:43@sha256:aacc26afb76de5a9767380b5d0da0ce2a292960cb6c669bb0943af3dcefca777

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
