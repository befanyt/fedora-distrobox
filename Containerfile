FROM quay.io/fedora/fedora-toolbox:43@sha256:78afd2fb4cb257fcd8430d54a8db24d842de102fb499c65af65e99213624f0ab

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
