FROM quay.io/fedora/fedora-toolbox:43@sha256:5ef00437075f55783d5411ecf124d446b603ee8a84ac8c56e36bd6a7bfcf48a3

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
