FROM quay.io/fedora/fedora-toolbox:43@sha256:8eb068383af7ac5c72d9f3b56168ff682cba44381aadca75d608f67df08de056

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
