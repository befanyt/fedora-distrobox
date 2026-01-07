FROM quay.io/fedora/fedora-toolbox:43@sha256:6954c98d370537a5c32d9dd3d3723af686a1e63b61b3462260fdb4e53b51b9e4

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
