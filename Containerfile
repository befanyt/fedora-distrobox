FROM quay.io/fedora/fedora-toolbox:46@sha256:e54cf43a205ec93739540d6d6eb6f5dc711b0eebb9b044ed1b4a39646902aea5

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
