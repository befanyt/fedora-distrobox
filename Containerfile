FROM quay.io/fedora/fedora-toolbox:43@sha256:e05f27eb0a2b28f010af7515da80cb8cf1f5962f02fa9792bec8247cfa616fa0

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
