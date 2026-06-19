FROM mcr.microsoft.com/azure-cli:latest

ENV TERRAFORM_VERSION=1.9.0
ENV OPA_VERSION=0.64.1

RUN apk add --no-cache curl unzip python3 py3-pip && \  
    curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \  
    curl -L -o opa https://openpolicyagent.org/downloads/v${OPA_VERSION}/opa_linux_amd64_static && \
    mv opa /usr/local/bin/opa && \
    chmod +x /usr/local/bin/opa && \
    pip install --break-system-packages azure-cli && \
    apk del curl unzip

WORKDIR /app
RUN terraform --version && opa version && az --version && python3 --version