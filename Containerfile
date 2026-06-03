FROM quay.io/fedora/fedora-toolbox:43@sha256:c7ddd32304920aa561f8299d6587b4b0263a7353798369457fa942aae371d324

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
