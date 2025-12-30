FROM quay.io/fedora/fedora-toolbox:43@sha256:f4dddb7ef6ccc95ddc9f15f83d58a82555c59620e6f37eac72d537609cc5e332

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
