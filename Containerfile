FROM quay.io/fedora/fedora-toolbox:43@sha256:3e5ab029180f45e93081004555749a716a2be43864e45269ede3a87aa1f64efb

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
