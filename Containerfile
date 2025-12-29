FROM quay.io/fedora/fedora-toolbox:43@sha256:3ec65cdf214f7fd917807b3a7b79f1c48dcec27abeb46204fa030612a1017bea

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
