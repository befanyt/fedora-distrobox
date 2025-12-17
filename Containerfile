FROM quay.io/fedora/fedora-toolbox:43@sha256:0f181c01913ad5b1fd787c951e724c8a411bc5afa9aea0dadeab56252805ce0c

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
