FROM quay.io/fedora/fedora-toolbox:43@sha256:f354723c1f77ad8c059df90ed27e2e84695f9a919489114c0fa87ed0b2a5bbaa

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
