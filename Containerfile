FROM quay.io/fedora/fedora-toolbox:43@sha256:10b862ac3898dfcfd8e5f05aa41b61ca2248e6c9e01937d4dd890ad4b04d4285

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
