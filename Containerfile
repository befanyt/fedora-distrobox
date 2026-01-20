FROM quay.io/fedora/fedora-toolbox:43@sha256:9a0b59bec5149957013d10f57c166e8d3ba1c778100fa28de96596cf5889e8ed

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
