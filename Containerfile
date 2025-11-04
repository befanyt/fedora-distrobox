FROM quay.io/fedora/fedora-toolbox:43@sha256:2ffe477cf95f5c43418bab8b7fb11e680aa695b9a13a424c1527313678b42b5f

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
