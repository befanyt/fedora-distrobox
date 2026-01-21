FROM quay.io/fedora/fedora-toolbox:43@sha256:d9aa3306f646f97ebc15eac293300d2e9d3f763b6b38b4bf890ac124db42e40f

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
