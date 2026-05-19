FROM quay.io/fedora/fedora-toolbox:43@sha256:ddbb2e57ca2942ba7d61eb689410d8ea8a796c8501db5a1ce0d3d34419966426

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
