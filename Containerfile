FROM quay.io/fedora/fedora-toolbox:43@sha256:03511457135613d83c7c8d637b0c53a44494f1b7b3617fb6b53d0829ec375324

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
