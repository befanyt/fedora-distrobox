FROM quay.io/fedora/fedora-toolbox:42@sha256:a70e2c3ecec1b391ad3596ac2931db483f63246d7b8307c8dc59709d7af3f761

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
