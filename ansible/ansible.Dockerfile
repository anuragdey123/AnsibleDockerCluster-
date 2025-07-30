FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    python3 \
    python3-pip \
    sshpass \
    openssh-client \
    ansible \
    && apt clean

RUN mkdir /ansible
WORKDIR /ansible

COPY playbook.yaml .

CMD ["sleep", "3600"]
