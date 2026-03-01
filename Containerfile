FROM quay.io/fedora/fedora-toolbox:43@sha256:92850eec8fae307cb62fc9ed61794df2b6bdadec115e84056e88ccf294ddc1fe

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
