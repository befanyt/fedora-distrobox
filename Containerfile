FROM quay.io/fedora/fedora-toolbox:43@sha256:a30b0e3fc0be71dddd83d3c1fdb32ccbd285d82ade60ce6568b20a00a8e6b170

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
