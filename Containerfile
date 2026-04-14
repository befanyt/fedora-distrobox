FROM quay.io/fedora/fedora-toolbox:43@sha256:8999ac0e941d64bb57da741a6c980c27ba35887daf70f543fddc91cf260ab52a

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
