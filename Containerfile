FROM quay.io/fedora/fedora-toolbox:43@sha256:8f2f12fce101b3105453f6344ae67cab7da676a84b026519b6da6a050eeebd8d

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
