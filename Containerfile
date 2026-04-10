FROM quay.io/fedora/fedora-toolbox:43@sha256:aca3d9761931ba4844e2b42f65e0531150716ada835a30b5cfc4264ee2b12222

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
