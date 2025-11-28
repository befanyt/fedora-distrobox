FROM quay.io/fedora/fedora-toolbox:43@sha256:74a50b2caae0aca132f3ad29f8f0bdca29a774d72630557600715145836b3994

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
