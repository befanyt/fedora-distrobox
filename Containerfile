FROM quay.io/fedora/fedora-toolbox:43@sha256:d0b2b0234c117d51773a9cd07c46d11570e258117c27c5d30cc855c8de924160

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
