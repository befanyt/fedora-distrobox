FROM quay.io/fedora/fedora-toolbox:43@sha256:28d9a922089331b17f0cd2e81475a55d0177a265c07df758bf49048a88963a75

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
