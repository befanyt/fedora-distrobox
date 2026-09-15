FROM quay.io/fedora/fedora-toolbox:43@sha256:13384cc80b787b6d661b68270c4e3d4b146c13bc6a975f9885487e45a8aa1c97

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
