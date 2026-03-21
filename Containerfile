FROM quay.io/fedora/fedora-toolbox:43@sha256:2234a4c48041ea52092d49fca89340d399ce686924b73b0897c6c2bccbf8b6f1

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
