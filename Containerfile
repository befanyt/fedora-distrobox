FROM quay.io/fedora/fedora-toolbox:43@sha256:7e04d89676850bf21ead4f4d556e2609b57b4d629780ee018278e7876f7454ad

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
