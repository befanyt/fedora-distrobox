FROM quay.io/fedora/fedora-toolbox:43@sha256:be20fb85f615f4a03498112d24488541d87451ce539a7c5d431eefbabe5b82b0

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
