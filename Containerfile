FROM quay.io/fedora/fedora-toolbox:43@sha256:7b257150c29d257b5e26d02516b700dbb3ef505cffb2009b4918fc228a7cb02a

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
