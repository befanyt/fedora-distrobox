FROM quay.io/fedora/fedora-toolbox:43@sha256:5714b5e93a1946413a5b953dc36b169a0ee271e01b6e3f902057974810281be1

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
