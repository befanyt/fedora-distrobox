FROM quay.io/fedora/fedora-toolbox:42@sha256:f3ecc59d1bbcb5b868e9a97fd8880f96945a1b38d3dc23554cb302460f63226a

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
