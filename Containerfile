FROM quay.io/fedora/fedora-toolbox:43@sha256:8894a57e9781a8c2e377724cc5ace9ce9ac4c621f8dff68434693aa91d5a6422

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
