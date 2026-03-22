FROM quay.io/fedora/fedora-toolbox:43@sha256:34d4aca73e5268f6f63fc6b021da3d440a893d36ca6258a22576dc3b8d204953

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
