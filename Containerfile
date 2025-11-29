FROM quay.io/fedora/fedora-toolbox:43@sha256:f296220823b393d4fa8bb2eb0108d62f24baca4d308dab254ea523206efbe539

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
