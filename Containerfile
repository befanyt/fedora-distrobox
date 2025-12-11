FROM quay.io/fedora/fedora-toolbox:43@sha256:df98c773ab070181c8ddc36263f30943bca92d1bee6712b8c308b1d73a3e1d9b

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
