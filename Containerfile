FROM quay.io/fedora/fedora-toolbox:43@sha256:21f99a42d1dc8f0641bfc8b3635ee58f56706cc1a06d35fb21abd3e64496c8d9

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
