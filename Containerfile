FROM quay.io/fedora/fedora-toolbox:43@sha256:c1088fb3c1c51ce58c7af3991d48e5aea15561c9016f76cdba52dd59d6db65b0

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
