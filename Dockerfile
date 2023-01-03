ARG NODE_VERSION=18

FROM node:${NODE_VERSION}-buster

ARG ROOTHOME=/home/bandcap

RUN mkdir -p $ROOTHOME
ENV HOME=$ROOTHOME

RUN apt-get update 
RUN apt install --force-yes -y ca-certificates curl \
    build-essential gcc g++ \
    tzdata zip unzip vim wget zsh \
    git openssh-client zsh bash net-tools tmux sudo wget 
# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*


# RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
# COPY ./zsh/zsh-in-docker.sh /tmp
# RUN chmod +x /tmp/zsh-in-docker.sh && \
#     /tmp/zsh-in-docker.sh \
#     -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
#     -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
#     -p git \
#     -p https://github.com/zsh-users/zsh-autosuggestions \
#     -p https://github.com/zsh-users/zsh-completions \
#     -p https://github.com/zsh-users/zsh-history-substring-search \
#     -p https://github.com/zsh-users/zsh-syntax-highlighting \
#     -p 'history-substring-search' \
#     -a 'bindkey "\$terminfo[kcuu1]" history-substring-search-up' \
#     -a 'bindkey "\$terminfo[kcud1]" history-substring-search-down'

# 使用zsh
RUN wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O- | zsh || true

# Modify Timezone
ENV TZ Asia/Shanghai
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Mark zsh as default shell
# RUN chsh -s /usr/bin/zsh
# Enable pnpm
# RUN corepack enable
# install nest cli
RUN npm config set registry https://registry.npmmirror.com
RUN npm install -g @nestjs/cli --verbose

# Copy local config to p10k zsh
# COPY ./zsh/.p10k.zsh $ROOTHOME/
# COPY ./zsh/.tmux.conf $ROOTHOME/

# ENTRYPOINT [ "/bin/zsh" ]
# CMD ["-l"]
CMD [ "zsh" ]

