FROM quay.io/fedora/fedora-toolbox:43@sha256:6c1f616bb3f505c1923a8eb888d91f9f688b409e8f01063a549bb221115f9c0d

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
