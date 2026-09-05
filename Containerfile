FROM quay.io/fedora/fedora-toolbox:46@sha256:7fc29539ba786b91b9bb056a3b163a1f693eda88318536a3da7d9c04ad091224

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
