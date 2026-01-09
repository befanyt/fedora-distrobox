FROM quay.io/fedora/fedora-toolbox:43@sha256:d455ccebd6a0f0651705621c22064266ceaf62b7bfbe54c6fd3d4dd9a323207d

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
