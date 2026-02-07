FROM quay.io/fedora/fedora-toolbox:43@sha256:7b57f71aef25cfa4e494b9fbe41708ebccd033f4df887b71b70ae2635151b316

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
