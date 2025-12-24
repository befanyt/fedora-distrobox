FROM quay.io/fedora/fedora-toolbox:43@sha256:8ca7c011e410d03f460b135e2aff484a8d6c909f0ad9fea8ad633d684ff4a873

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
