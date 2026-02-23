FROM quay.io/fedora/fedora-toolbox:43@sha256:f6eeb43af028dca337b6ca19b4c849cba31d25e6c519bbf18bb93a5d933eb67f

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
