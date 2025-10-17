FROM quay.io/fedora/fedora-toolbox:42@sha256:568b63af737346d363eb12167557d8a9dacd55e0dcf482529da008e9a1027f39

RUN <<EORUN
set -euxo pipefail

sed -i "s/enabled=1/enabled=0/" "/etc/yum.repos.d/fedora-cisco-openh264.repo"

dnf -y install --setopt=install_weak_deps=False \
	dnf-plugins-core \
	pinentry

dnf -y install --setopt=install_weak_deps=False \
    just \
    btop

dnf clean all
EORUN
