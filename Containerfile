FROM quay.io/fedora/fedora-toolbox:43@sha256:7ae6f32ff76a6385885385a48b98c83f53910a12b7787e54a166d9b08b786bbf

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
