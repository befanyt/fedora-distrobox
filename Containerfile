FROM quay.io/fedora/fedora-toolbox:43@sha256:03d8f595c4a40dd3ddf0a4fa0a63f96ebc093a4f7eae537b3729838b03e66df2

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
