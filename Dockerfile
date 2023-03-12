FROM ubuntu:latest

RUN apt-get update && apt-get install -y curl git python3 vim zsh

COPY . /root/dotfiles/
