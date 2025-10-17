FROM registry.fedoraproject.org/fedora-toolbox:42

RUN <<EORUN
set -euxo pipefail

dnf -y install just btop
dnf clean all
EORUN
