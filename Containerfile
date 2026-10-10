FROM quay.io/fedora/fedora-toolbox:46@sha256:8f4817b656bd369afcc3f57db4de2e17ed02ea8945c0bc8b581774910a7594fc

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
