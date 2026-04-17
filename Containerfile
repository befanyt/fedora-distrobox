FROM quay.io/fedora/fedora-toolbox:43@sha256:45dfef08da99446ef45672347ba5fce1efe496f2ab35ed26432c1929e5f2b848

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
