FROM quay.io/fedora/fedora-toolbox:43@sha256:097f02b85fa56607d3467ca17f53412f78ba4c758e9b0735df888069288e1b84

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
