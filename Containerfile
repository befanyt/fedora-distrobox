FROM quay.io/fedora/fedora-toolbox:43@sha256:ad781bdab4d45fe57fb25c6cd52fb343b406782ae43d9767edbd0ef1f8ac264b

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
