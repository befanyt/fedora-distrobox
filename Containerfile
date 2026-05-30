FROM quay.io/fedora/fedora-toolbox:43@sha256:de6892e7e7171ea294c593d6d5c16400ba2b370fbbeb7b954762caf3aa122d53

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
