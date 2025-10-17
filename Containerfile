FROM quay.io/fedora/fedora-toolbox:42

RUN <<EORUN
set -euxo pipefail

dnf -y install just btop
dnf clean all
EORUN
