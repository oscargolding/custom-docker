# Want the latest version of Arch Linux being used
ARG  CODE_VERSION=latest
FROM archlinux:${CODE_VERSION}

# Do a full system update if possible
RUN pacman -Syu --noconfirm python nodejs npm zsh zsh-completions bat tmux fd \
    tree git neovim ranger zsh-syntax-highlighting fzf curl base-devel

# Change the default shell over to zsh
RUN chsh -s /usr/bin/zsh

RUN zsh

# Get haskell support working
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# First get the zshrc file and copy it into the container, after source it
COPY .zshrc /root/

RUN mkdir -p /root/repos

# Tmux parts
COPY .tmux.conf /root/

RUN git clone https://github.com/tmux-plugins/tpm /root/.tmux/plugins/tpm

# Git stuff
RUN git config --global user.name "oscargolding"
RUN git config --global user.email "oscargolding17@gmail.com"

# Set the work directory for interacting with the container
WORKDIR /root/repos

# Start ZSH first
CMD ["/usr/bin/zsh"]