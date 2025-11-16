FROM quay.io/fedora/fedora-toolbox:43@sha256:fd0bc214d71d4dd89c0cefb3286a22eb7449474142a660a7a90c76359073ac73

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
