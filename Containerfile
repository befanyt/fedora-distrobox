FROM quay.io/fedora/fedora-toolbox:43@sha256:8c5683e0ec17150e439dcf163fe3f1570ac43606b8ad9310a89f0bed4cd682ac

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
