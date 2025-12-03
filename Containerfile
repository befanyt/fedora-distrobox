FROM quay.io/fedora/fedora-toolbox:43@sha256:bc0a7a0e77e05c7b9cdcea6b266a386c8882736a5ca08c55919239d012b6a7ad

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
