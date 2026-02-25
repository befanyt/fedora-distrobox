FROM quay.io/fedora/fedora-toolbox:43@sha256:0dd0451d2c4adea1bcc0db40356c118f2412ddb2588ab6af806adb0b3d81ab42

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
