FROM quay.io/fedora/fedora-toolbox:43@sha256:60421e9348b5eae6e069ff9b6b029a2db2146db163a1b545d0a692356f3da4fe

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
