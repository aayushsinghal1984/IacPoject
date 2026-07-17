################################################################################
# Tool Images
################################################################################

FROM hashicorp/terraform:1.13.0 AS terraform
FROM hashicorp/packer:1.14.0 AS packer
FROM ghcr.io/terraform-linters/tflint:v0.59.1 AS tflint
FROM aquasec/trivy:0.65.0 AS trivy
FROM openpolicyagent/opa:1.0.0-debug AS opa
FROM ghcr.io/gitleaks/gitleaks:v8.28.0 AS gitleaks

################################################################################
# Final Image
################################################################################

FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        bash \
        curl \
        wget \
        git \
        jq \
        unzip \
        zip \
        python3 \
        python3-pip \
        openssh-client \
        ca-certificates \
        gnupg \
        software-properties-common && \
    rm -rf /var/lib/apt/lists/*

################################################################################
# Azure CLI
################################################################################

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

################################################################################
# Terraform
################################################################################

COPY --from=terraform /bin/terraform /usr/local/bin/terraform

################################################################################
# Packer
################################################################################

COPY --from=packer /bin/packer /usr/local/bin/packer

################################################################################
# TFLint
################################################################################

COPY --from=tflint /usr/local/bin/tflint /usr/local/bin/tflint

################################################################################
# Trivy
################################################################################

COPY --from=trivy /usr/local/bin/trivy /usr/local/bin/trivy

################################################################################
# OPA
################################################################################

COPY --from=opa /opa /usr/local/bin/opa

################################################################################
# Gitleaks
################################################################################

COPY --from=gitleaks /usr/bin/gitleaks /usr/local/bin/gitleaks

################################################################################
# Directories
################################################################################

RUN mkdir -p \
    /workspace \
    /root/.terraform.d \
    /root/.config/packer/plugins

WORKDIR /workspace

################################################################################
# Verification
################################################################################

RUN terraform version && \
    packer version && \
    tflint --version && \
    opa version && \
    trivy --version && \
    gitleaks version

CMD ["/bin/bash"]