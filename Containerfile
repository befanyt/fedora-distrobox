FROM quay.io/fedora/fedora-toolbox:43@sha256:c50bcca5027a172bb7e376b6c5243faf192f2e7a75d244229c2339e5e24c233c

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
