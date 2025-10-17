FROM quay.io/fedora/fedora-toolbox:42@sha256:568b63af737346d363eb12167557d8a9dacd55e0dcf482529da008e9a1027f39

RUN <<EORUN
set -euxo pipefail

dnf -y install just btop
dnf clean all
EORUN
