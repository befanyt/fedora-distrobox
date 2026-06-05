FROM quay.io/fedora/fedora-toolbox:43@sha256:081ed342bca1cbcb7a6475f1571dc4719c8cb22d6d50e35cfe07eef39b8c69e5

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
