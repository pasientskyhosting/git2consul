FROM alpine:3.2
MAINTAINER Calvin Leung Huang <https://github.com/calvn>

RUN apk --update add nodejs git openssh ca-certificates && \
    rm -rf /var/cache/apk/* && \
    npm install git2consul@0.12.13 --global && \
    mkdir -p /etc/git2consul.d

RUN mkdir -p -m 0700 /root/.ssh && \
    echo -e "Host *\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

ENTRYPOINT [ "/usr/bin/node", "/usr/lib/node_modules/git2consul" ]
