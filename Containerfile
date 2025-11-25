FROM quay.io/fedora/fedora-toolbox:43@sha256:9ead1dd7064a4f699b0f3cea727108f7c5d48f3858971987a6b824be90a23dba

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
