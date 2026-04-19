FROM quay.io/fedora/fedora-toolbox:43@sha256:ce582e63ed04000f640624322a5207e90a8f3c9849da36a25a199bc6c9fd22fc

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
