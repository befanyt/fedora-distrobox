FROM quay.io/fedora/fedora-toolbox:43@sha256:a52f3edc370462d003ecb71580db32ff570f18c2555a65e2daa1df8db487e21e

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
