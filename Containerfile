FROM quay.io/fedora/fedora-toolbox:43@sha256:ab47f3836300b6d8c993f6a16164302e7ab1a511f49e8f5a406be418d5bfd714

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
