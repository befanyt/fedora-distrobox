FROM quay.io/fedora/fedora-toolbox:46@sha256:0273b145c83036f50d94aa24b9b1b91ec7caf3841fe840c45b5338e40164aac9

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
