FROM quay.io/fedora/fedora-toolbox:44@sha256:a73754caec746a893375fe86510bb3f5d24b115a45ff59b93741f5775a8606f6

RUN <<EORUN
set -euxo pipefail

dnf -y install just btop
dnf clean all
EORUN
