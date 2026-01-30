FROM quay.io/fedora/fedora-toolbox:43@sha256:b03b332d2ae1bce3cdaf7b72461ad4617714b8c9417cafa072b0008ced347807

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
