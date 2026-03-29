FROM quay.io/fedora/fedora-toolbox:43@sha256:67d7502287a5a8c526cf6b094287449c759632a5eb6095489d5a587e7266801e

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
