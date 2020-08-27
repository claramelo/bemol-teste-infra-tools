FROM ubuntu:bionic

ARG aws_access_key_id
ARG aws_secret_access_key

ENV AWS_ACCESS_KEY_ID=$aws_access_key_id
ENV AWS_SECRET_ACCESS_KEY=$aws_secret_access_key

# Install prerequisities for Terraform
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install Terraform
RUN wget --quiet https://releases.hashicorp.com/terraform/0.13.0/terraform_0.13.0_linux_amd64.zip \
  && unzip terraform_0.13.0_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_0.13.0_linux_amd64.zip

# Copy your ansible configuration into the image
COPY ./ /terraform
WORKDIR /terraform
RUN chmod u+x exec-terraform

ENTRYPOINT [ "./exec-terraform" ]