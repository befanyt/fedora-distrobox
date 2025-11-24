FROM quay.io/fedora/fedora-toolbox:43@sha256:2b1ad668aee1e67083382f1e7832136de45e5105c9bd9e86ad961eb982456aa1

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
