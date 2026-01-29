FROM quay.io/fedora/fedora-toolbox:43@sha256:377e6a666eef64275f69e29b2bd68740f4d2622675430f5f873b006c868e1fde

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
