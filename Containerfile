FROM quay.io/fedora/fedora-toolbox:43@sha256:9683aeb3186735c6da958c1711dd6ede42aa44e3182ee68ba54d1aafc9abd6fc

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
