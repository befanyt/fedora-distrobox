FROM quay.io/fedora/fedora-toolbox:43@sha256:491d4fe7294246ebb35db8adfb1f35db50f21bc91169c7eea8386cf27fa84cdb

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
