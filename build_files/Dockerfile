FROM    node:18.18.0-bookworm
USER    root
WORKDIR /
COPY    xo_setup.sh xo_setup.sh
RUN     bash xo_setup.sh && \
        rm xo_setup.sh && \
        apt-get -y autoclean
WORKDIR /xen-orchestra/packages/xo-server
CMD     yarn start
