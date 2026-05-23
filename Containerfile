FROM quay.io/fedora/fedora-toolbox:43@sha256:1414db9ffeca7c84c8e40138ba749d0a0c756dcbc750367192db11b07bbed103

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
