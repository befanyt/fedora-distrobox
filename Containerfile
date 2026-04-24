FROM quay.io/fedora/fedora-toolbox:43@sha256:8b32a546433a54f3e93811a1ebf7e599c71fa0d00912db381b6e1acc00c537a6

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
