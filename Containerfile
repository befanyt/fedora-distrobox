FROM quay.io/fedora/fedora-toolbox:42@sha256:602df003c97d1b692bb4e3830073ad7525c2e3a4e461ad104c563b9ce29fd967

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
