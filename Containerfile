FROM quay.io/fedora/fedora-toolbox:43@sha256:19bc387820aadb686cf15a180ac453e78fbf028a6ae32ae3c19d25bd33aaedca

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
