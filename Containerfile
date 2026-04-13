FROM quay.io/fedora/fedora-toolbox:43@sha256:d481ea7a2f77f72b31ec5a122853df13bba3533b40b1b5d50d0083f70d66b22f

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
