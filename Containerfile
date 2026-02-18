FROM quay.io/fedora/fedora-toolbox:43@sha256:49f8f994cf960a0835da96c46624c363a8a2a032c374f981f9a47107c87ef6f8

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
