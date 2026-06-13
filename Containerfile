FROM quay.io/fedora/fedora-toolbox:43@sha256:e4c7421e5471f3335960e7803526fdfe42cfbb8f6ffbe14a02d90310428149b8

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
