FROM ubuntu
RUN apt -y update && apt -y install git build-essential libftdi-dev libssl1.0-dev
RUN git clone https://chromium.googlesource.com/chromiumos/third_party/tpm2 tpm2
RUN git clone https://github.com/vbendeb/tpm2_server.git tpm2_server
WORKDIR tpm2_server
RUN make
EXPOSE 9883
ENTRYPOINT [ "/build/tpm2_server/ntpm", "-s", "-dd" ]
