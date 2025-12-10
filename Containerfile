FROM quay.io/fedora/fedora-toolbox:43@sha256:30fca8d3424a12740947f23df102c44b5202c21912140b959b6d50c8e630b8ff

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
