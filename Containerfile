FROM quay.io/fedora/fedora-toolbox:43@sha256:1d0e0d5a43fab05a70ab15e0b13389afdabf4e673a87fea437494bfabc19893f

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
