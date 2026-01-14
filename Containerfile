FROM quay.io/fedora/fedora-toolbox:43@sha256:bf743f40f361102fb3b414717a80834ee3b616ec0b29eb6db45604b7356d2705

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
