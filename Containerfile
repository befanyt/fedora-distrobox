FROM quay.io/fedora/fedora-toolbox:43@sha256:4bb7f95cefd6e39cee2f420f22300f0b88ab47b7594a5f34512319cd0062a1ba

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
