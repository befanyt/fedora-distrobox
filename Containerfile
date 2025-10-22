FROM quay.io/fedora/fedora-toolbox:42@sha256:46ec46f487aa61b89cdb9399d272f9c55cfe98bf25b4d35c1ca0668d26a8dedc

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
