FROM quay.io/fedora/fedora-toolbox:42@sha256:9f517160ad6c88928eda05f4c6235acb05d4edaf291d28cc7506c931ed935f96

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
