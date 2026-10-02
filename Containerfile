FROM quay.io/fedora/fedora-toolbox:46@sha256:00ac792104ac73aa36e6bf3bff19180ba64131ce5cdfdc45284e6692d24cf60a

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
