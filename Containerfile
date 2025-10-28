FROM quay.io/fedora/fedora-toolbox:42@sha256:5ff9fe1b5b410ed04e9fa9670a2533845164dacdbc5c4dc3ccd382786ca6662f

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
