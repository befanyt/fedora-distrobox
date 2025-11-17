FROM quay.io/fedora/fedora-toolbox:43@sha256:dcab587c5afca7863b123e2bea117850276ec0bbe08c35c2991ff210c365d23c

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
