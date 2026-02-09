FROM quay.io/fedora/fedora-toolbox:43@sha256:0171388256510feec18cb2016639ad50d446541fe924a1d8d88ae22967ddb297

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
