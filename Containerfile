FROM quay.io/fedora/fedora-toolbox:43@sha256:4b6ca71691b614f933be3a009a1daa08540e7d08c1ca9426521c726fcfb77f9b

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
