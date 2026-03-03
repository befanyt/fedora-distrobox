FROM quay.io/fedora/fedora-toolbox:43@sha256:204c2b3b56e4c8f32f79bada9427fe368fa3981346aecd6b58225b7653b21230

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
