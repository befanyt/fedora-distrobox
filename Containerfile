FROM quay.io/fedora/fedora-toolbox:43@sha256:2f43984bb74d38e123953798a873651080b203cfa95c9cefd09f3fa57b2e4b21

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
