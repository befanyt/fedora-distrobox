FROM quay.io/fedora/fedora-toolbox:43@sha256:4451140dbc74a700195f0ebb8e78e14732fcfa18895b0e3da4ae6c48223541c5

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
