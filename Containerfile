FROM quay.io/fedora/fedora-toolbox:43@sha256:bb7749066ddf918de866f10085402964d5409c65184dbe8e5e26f44723c3cb37

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
