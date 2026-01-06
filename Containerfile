FROM quay.io/fedora/fedora-toolbox:43@sha256:bcc03fac7f7743bc0c3600dc532d5cc19f3d2717cca745548f44d81617f82ad6

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
