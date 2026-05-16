FROM quay.io/fedora/fedora-toolbox:43@sha256:cfd624134eb3933d853bc11f1fa0802ca00d31fd95fa30dbe6506f55f1132f90

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
