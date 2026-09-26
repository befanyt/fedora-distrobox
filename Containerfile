FROM quay.io/fedora/fedora-toolbox:46@sha256:6b0b3d0d0aaf9b75c2a22c3f23583743a7b47fe0e099a739269b4197aed600c8

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
