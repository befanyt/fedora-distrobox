FROM quay.io/fedora/fedora-toolbox:43@sha256:0fc24be95299a3ed4c4e4a36f2bd42b6551b72d7f8e99cd9f18f3139c540b873

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
