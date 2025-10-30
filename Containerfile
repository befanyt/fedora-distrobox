FROM quay.io/fedora/fedora-toolbox:43@sha256:0e5eee96bd88f5db9b492359e2a57ce5e6be1306df5b8b109f53d4103c3c1897

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
