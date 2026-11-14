FROM quay.io/fedora/fedora-toolbox:43@sha256:722930d55ede7174cd3f34f4eb70c54b347f19a332236be45fdf6f5acc346fe3

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
