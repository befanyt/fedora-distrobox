FROM quay.io/fedora/fedora-toolbox:43@sha256:8defdc12a997e494b164d5eb25f387b2f78866400582adeea5a63cc99e4f619b

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
