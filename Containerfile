FROM quay.io/fedora/fedora-toolbox:43@sha256:42b9f70cc0099be865e40e0f79b744c1e4d3baf5c6077b9325a89a2a4b17c191

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
