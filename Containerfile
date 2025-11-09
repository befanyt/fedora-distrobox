FROM quay.io/fedora/fedora-toolbox:43@sha256:853dd1273c8c13461ea5b6abdcd673eb4a173b61627c763ee5e69b841bfd451e

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
