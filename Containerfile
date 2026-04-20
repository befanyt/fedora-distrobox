FROM quay.io/fedora/fedora-toolbox:43@sha256:5f99ad72b5a317e4fadc634e2b2768bc742f531802162d1443dabfb80cca53ea

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
