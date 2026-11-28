FROM quay.io/fedora/fedora-toolbox:43@sha256:999182edad439897d36bcf1af42a0bfdcd73f5df1c80f65dec17a307049a9670

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
