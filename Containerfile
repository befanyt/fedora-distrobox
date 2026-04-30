FROM quay.io/fedora/fedora-toolbox:43@sha256:94009270930c26c5b997423254badb4e224bd5e9f175d7e9d1ac706a47d5ecc9

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
