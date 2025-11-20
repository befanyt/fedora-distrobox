FROM quay.io/fedora/fedora-toolbox:43@sha256:919e229e3a4574b3db40658e9ab504046734f772f6910245b83c3c6337a2df22

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
