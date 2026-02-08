FROM quay.io/fedora/fedora-toolbox:43@sha256:a892fa07bb56aab6a3386af43bc2525ebda0f5047037228b04373908ae4da486

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
