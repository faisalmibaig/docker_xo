#docker build . -t local/xo:5.99.0
FROM    node:20.17.0-bookworm-slim
USER    root
WORKDIR /
COPY    xo_setup.sh xo_setup.sh
RUN     bash xo_setup.sh && \
        rm xo_setup.sh && \
        apt-get -y autoclean
WORKDIR /xen-orchestra/packages/xo-server
CMD     ["yarn", "start"]