FROM quay.io/fedora/fedora-toolbox:43@sha256:f6b51ec7d2fff3b63cee8f9f59b5a38cbd6a30a7f33989604407b4f6252a63e3

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
