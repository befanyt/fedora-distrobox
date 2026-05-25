FROM quay.io/fedora/fedora-toolbox:43@sha256:102653f3aba9459b88545d9fa959b0b5063b478682b5cd5a447a125df0f44fb3

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
