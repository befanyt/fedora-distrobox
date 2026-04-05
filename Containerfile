FROM quay.io/fedora/fedora-toolbox:43@sha256:96a86c1460deda5ec5ba15f026dd5a72cf191563dfd3da15c70a2ce2843e6b6c

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
