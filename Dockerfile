FROM ubuntu
RUN apt -y update && apt -y install git build-essential libftdi-dev libssl1.0-dev
RUN git clone https://chromium.googlesource.com/chromiumos/third_party/tpm2 tpm2
RUN git clone https://github.com/vbendeb/tpm2_server.git tpm2_server
WORKDIR tpm2_server
RUN make

FROM ubuntu
RUN apt -y update && apt -y install git libftdi-dev libssl1.0-dev
COPY --from=0 /build/tpm2_server/ntpm /
EXPOSE 9883
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD []

