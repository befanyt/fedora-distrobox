FROM quay.io/fedora/fedora-toolbox:42@sha256:99bb911d042cbc5728a1945d8b9bd6bd8da44e8d13478681816c9cbde971c3a0

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
