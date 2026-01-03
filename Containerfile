FROM quay.io/fedora/fedora-toolbox:43@sha256:ed8ce11f1f4450a5fedecf33819010d4d40a1cedbea2824ce335eda8d31b617c

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
