FROM quay.io/fedora/fedora-toolbox:43@sha256:aa2c5d1d437728dfebdccb203874cdb9cd80bd3ee551490ff16d26b918100e5e

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
