FROM quay.io/fedora/fedora-toolbox:43@sha256:14de0857b3a9b8c75b9757ab706b53769e3faeafe40d3da12e11de66384b9e84

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
