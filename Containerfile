FROM quay.io/fedora/fedora-toolbox:43@sha256:3e2f9528163894663b5dc32f28c2703351e105e9dfc6c0f28bf1bc9b3be01886

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
