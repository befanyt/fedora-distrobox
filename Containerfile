FROM quay.io/fedora/fedora-toolbox:43@sha256:bdbe829cb31028411f40d99a5073f5f92fa463e970dd2643350b4b0d81aa6588

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
