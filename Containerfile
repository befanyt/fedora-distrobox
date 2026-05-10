FROM quay.io/fedora/fedora-toolbox:43@sha256:e0c47f98f1be471e0077025bf8a4b971ec62da0c4b30f3c824c72483fee51087

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
