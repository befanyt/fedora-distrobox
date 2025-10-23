FROM quay.io/fedora/fedora-toolbox:42@sha256:42c1b7890e90d815dace302ef7b26cbb82f72f90f1b023061f908f5eef6c0a2f

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
