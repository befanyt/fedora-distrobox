FROM quay.io/fedora/fedora-toolbox:43@sha256:0f65cb44daf2e6da4b0fa80073107e2219ffa7cda90ea10766205b1edbc81b93

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
