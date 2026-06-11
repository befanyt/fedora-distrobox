FROM quay.io/fedora/fedora-toolbox:43@sha256:095cf18cf5388ec38682ebb2bcc3eff40176269529aaab71fb880d6078fd3a96

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
