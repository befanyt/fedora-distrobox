FROM quay.io/fedora/fedora-toolbox:43@sha256:ce01e84bf2c4774fc415b91d99c272d54b8dfec7b5ad274bf3f2bbdd866673c9

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
