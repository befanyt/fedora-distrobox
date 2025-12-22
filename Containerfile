FROM quay.io/fedora/fedora-toolbox:43@sha256:dad97d53e5d8c3c65b66e4a116c531dac27c1e8867028b71ff536a169f5ef3b6

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
