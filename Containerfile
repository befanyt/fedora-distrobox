FROM quay.io/fedora/fedora-toolbox:43@sha256:686acd02b694e56d5a2181372b83294b8e3ef577bc7cdf631b40b017ab6d5269

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
