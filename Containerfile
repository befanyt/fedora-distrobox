FROM quay.io/fedora/fedora-toolbox:43@sha256:d5e852f6532e5c6228bce3556485c6e11e8fbd9d6bfbaefbf86f67a2b40ebf8a

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
