FROM quay.io/fedora/fedora-toolbox:43@sha256:9f914a32fce2590a3a718d76ff44308efe23a359bf0de5eaab2dbd9c5c42ba18

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
