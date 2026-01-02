FROM quay.io/fedora/fedora-toolbox:43@sha256:b97a2b910b074b0b691e1b5197b56f7e88ab5e1acddc85bd83b42d13ff709222

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
