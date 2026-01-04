FROM quay.io/fedora/fedora-toolbox:43@sha256:a30965752786d61d891503ce675c9c63dfd5ccdd2c3648e291a3dc710069e133

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
