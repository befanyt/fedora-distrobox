FROM quay.io/fedora/fedora-toolbox:43@sha256:a57a737dc3b16f9f843261940d6f7b66f29620ed96d4ddf71eef30e58e5482c9

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
