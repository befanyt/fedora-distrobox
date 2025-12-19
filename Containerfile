FROM quay.io/fedora/fedora-toolbox:43@sha256:1c4aa425ef07b2473022b3a301b561673fbbcb0e5385bbb7f603066646c91ecc

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
