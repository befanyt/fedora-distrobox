FROM quay.io/fedora/fedora-toolbox:43@sha256:f6bb4d8f09d63424284e9fa140fe8303b7900fba988d719ad436e8ac5bc88173

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
