FROM quay.io/fedora/fedora-toolbox:43@sha256:eea470200526678b6a1889fec5f307620c7761a1e83dc2517a908322926a8324

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
