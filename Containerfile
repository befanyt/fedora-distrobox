FROM quay.io/fedora/fedora-toolbox:43@sha256:52e31d5e772335f079046ff30ca0ee2427cf67d920cfb4b98982044723c57956

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
