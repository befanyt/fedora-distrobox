FROM quay.io/fedora/fedora-toolbox:43@sha256:4cc906f839ca4dbfbc4b8e6b7f442398dfdd7ef9a2a398567a8464b4bf9f5c35

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
