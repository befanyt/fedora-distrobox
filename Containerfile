FROM quay.io/fedora/fedora-toolbox:43@sha256:d9d7330b70004b0e8c0c095e0c3c3937f4504479dd43ec9a66d4452e8ea3761d

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
