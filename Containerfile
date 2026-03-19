FROM quay.io/fedora/fedora-toolbox:43@sha256:44010f8c85b28b59b144b2ff6d72b978a8ed037a892b6b2368b93f2b61c050cf

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
