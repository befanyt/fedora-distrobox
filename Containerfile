FROM quay.io/fedora/fedora-toolbox:43@sha256:d26120d79d08030996c789955d97a4d13c66450959f1267b256d8dfc7addc110

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
