FROM quay.io/fedora/fedora-toolbox:43@sha256:e1ee25456a832177a764b1392e8bb8884d63e41cba8f81460b9725102747bb9d

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
