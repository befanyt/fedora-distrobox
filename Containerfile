FROM quay.io/fedora/fedora-toolbox:43@sha256:4ef5f2f633189cc0f3718ab20d1685147b0e52ee399bd6bb8531e3b6fdc22d06

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
