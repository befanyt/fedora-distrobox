FROM quay.io/fedora/fedora-toolbox:43@sha256:aa813f65ee6bd083d8584f1066a85999157f48442d09735e0cb1b359ec392046

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
