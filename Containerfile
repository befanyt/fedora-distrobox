FROM quay.io/fedora/fedora-toolbox:43@sha256:31589be31400ef330cf240d53e36374495d169a6d6bfb42987216d97c348b37d

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
