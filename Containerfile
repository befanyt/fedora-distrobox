FROM quay.io/fedora/fedora-toolbox:43@sha256:6605785933be322b4946d669d3f151adb706abcc998821b7e5cc1aa6960ceb96

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
