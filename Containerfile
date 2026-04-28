FROM quay.io/fedora/fedora-toolbox:43@sha256:82f9a80873452cb1b4ab60fbac41c2c0648febfe61f780fdef7788b9165aa1ad

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
