FROM quay.io/fedora/fedora-toolbox:43@sha256:30c79bca017593d16eeaea4bc30d81108e444be769597943be4d969abeb15141

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
