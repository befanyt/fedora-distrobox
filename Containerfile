FROM quay.io/fedora/fedora-toolbox:43@sha256:67f82db6dd9466f6d5a8d0a32430c8ab90ddb3ef9d45cf774bc8e32c8b65ac98

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
