FROM quay.io/fedora/fedora-toolbox:43@sha256:f5a6fd49b00a5f75aa01c04faf1dc7673adae1626aad489981048d2c1566d445

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
