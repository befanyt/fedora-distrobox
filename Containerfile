FROM quay.io/fedora/fedora-toolbox:43@sha256:e735207bb613935904ee09135cd3169cf03685a65d5995beb4fd8eec4a5b954b

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
