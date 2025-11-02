FROM quay.io/fedora/fedora-toolbox:43@sha256:f3846bfd8708bc86ba603e3aefc5865bae753d103a3eab1d0915c66f301261c8

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
