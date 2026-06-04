FROM quay.io/fedora/fedora-toolbox:43@sha256:d717daca5723382829071da390f97309e15165c9369bf2497c0376fe98f1ec19

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
