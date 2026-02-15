FROM quay.io/fedora/fedora-toolbox:43@sha256:77c140365d2d698d9bdd0541b6aed6e2c326a5750a4d6b48244f7121290b3241

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
