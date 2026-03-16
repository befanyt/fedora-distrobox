FROM quay.io/fedora/fedora-toolbox:43@sha256:0bd24f4db3437eb156277513823f13f51b4ed2fabf7332a1896e693fdf610bfa

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
