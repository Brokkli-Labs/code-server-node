FROM codercom/code-server:latest

USER root

RUN apt-get update && apt-get install -y gnupg2

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
    && apt-get install --no-install-recommends yarn

USER coder
WORKDIR /home/coder

# nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.25.0/install.sh | bash
