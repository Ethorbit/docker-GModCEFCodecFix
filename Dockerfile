FROM python:3.13.0 AS base

ARG UID=1000
ARG GID=1000

VOLUME /home/python/.steam/steam
WORKDIR /home/python

RUN groupadd -g "${GID}" python &&\
    useradd -g python -u "${UID}" python &&\
    mkdir -p /home/python/.steam/steam &&\
    chown -R python:python /home/python/ &&\
    chmod -R 750 /home/python/

USER python

FROM base AS project
RUN git clone https://github.com/solsticegamestudios/GModCEFCodecFix ./GModCEFCodecFix &&\
    pip install -r ./GModCEFCodecFix/requirements.txt

FROM project AS pyinstaller
WORKDIR /home/python/GModCEFCodecFix
ENV PATH="$PATH:/home/python/.local/bin"
RUN pip install pyinstaller &&\
    [ -f ./pyinstaller_linux.txt ] || exit 1 &&\
    cat ./pyinstaller_linux.txt | sh &&\
    cp ./dist/GModCEFCodecFix .

ENTRYPOINT [ "/home/python/GModCEFCodecFix/GModCEFCodecFix" ]
CMD [ "-steam_path", "/home/python/.steam/steam" ]
