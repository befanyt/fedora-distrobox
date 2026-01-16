FROM quay.io/fedora/fedora-toolbox:43@sha256:40a17a7d2fb5559cb44609fc64808efd0fbd878d667809933046f0d43e5873f3

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
