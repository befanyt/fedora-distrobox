FROM quay.io/fedora/fedora-toolbox:43@sha256:b7a59b33c492b793cfee3582d012efc13e9abdcb7ef95f96bb69ea45ae3a59ae

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
