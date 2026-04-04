FROM quay.io/fedora/fedora-toolbox:43@sha256:1c7d06bd60dd6965cab9026975a3a5a55c49f04c8a5309694f22bf2eed725baf

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
