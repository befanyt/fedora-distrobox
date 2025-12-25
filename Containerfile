FROM quay.io/fedora/fedora-toolbox:43@sha256:31753c1382a93bdeea8a9979ecddfd6a8579a84d433d67a76431b3cc1a113826

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
