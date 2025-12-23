FROM quay.io/fedora/fedora-toolbox:43@sha256:0495fd36c811323d5ebddba9086595f162a029bb29d391a44f5e9a074cf10920

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
