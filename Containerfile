FROM quay.io/fedora/fedora-toolbox:43@sha256:78e8b858ce3b31576439a8e4f8a057d8628f02aef37796ce5c153561c8fcd776

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
