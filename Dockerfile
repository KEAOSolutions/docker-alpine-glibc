FROM ukhomeoffice/gosu:latest

ARG ALLOW_UNTRUSTED=""
ENV ALLOW_UNTRUSTED ${ALLOW_UNTRUSTED}
ARG MIRROR_DOWNLOAD_URL=http://10.1.0.4/repo
ENV MIRROR_DOWNLOAD_URL $MIRROR_DOWNLOAD_URL
ENV PATH /usr/glibc-compat/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin


RUN echo "${MIRROR_DOWNLOAD_URL}" >> /etc/apk/repositories
COPY rsa.pub /etc/apk/keys/
RUN apk add --update glibc glibc-bin glibc-i18n ${ALLOW_UNTRUSTED}
RUN rm -rf /var/cache/apk/*

RUN localedef -i en_GB -c -f UTF-8 -A /usr/glibc-compat/share/locale/locale.alias en_GB.UTF-8
ENV LANG en_GB.UTF8

ENTRYPOINT ["sh"]
