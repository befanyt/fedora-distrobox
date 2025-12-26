FROM quay.io/fedora/fedora-toolbox:43@sha256:d2fa5967b50c42f4264bf6ee212e56e9138493cbc8395de7dd18c4797e70c5f6

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
