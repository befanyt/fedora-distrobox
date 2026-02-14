FROM quay.io/fedora/fedora-toolbox:43@sha256:6a5d03a90503127344ed3a5345606a8a87a8fb053d13fd22132b146d4180cdc4

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
