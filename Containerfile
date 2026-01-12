FROM quay.io/fedora/fedora-toolbox:43@sha256:911f99bc6888e3257854c5e269fdfbe697cf23d3f0c3cea3538e98d467a71fd2

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
