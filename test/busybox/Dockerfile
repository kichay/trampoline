FROM --platform=x86-64 ubuntu:focal as builder

ARG MUSL_VERSION=1.2.1
ARG BUSYBOX_VERSION=1.31.1

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
        build-essential \
        curl \
        file \
        lzip \
        m4 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
RUN curl -L http://musl.libc.org/releases/musl-${MUSL_VERSION}.tar.gz --output musl-${MUSL_VERSION}.tar.gz \
    && tar -xf musl-${MUSL_VERSION}.tar.gz
RUN curl -L https://busybox.net/downloads/busybox-${BUSYBOX_VERSION}.tar.bz2 --output busybox-${BUSYBOX_VERSION}.tar.bz2 \
    && tar -xf busybox-${BUSYBOX_VERSION}.tar.bz2

WORKDIR /usr/src/musl-${MUSL_VERSION}
RUN ./configure \
    && make \
    && make install \
    && ln -s /usr/bin/ar /usr/local/bin/musl-ar \
    && ln -s /usr/bin/strip /usr/local/bin/musl-strip \
    && ln -s /usr/local/musl/bin/musl-gcc /usr/local/bin/musl-gcc \
    && ln -s /usr/include/mtd /usr/local/musl/include/mtd \
    && ln -s /usr/include/linux /usr/local/musl/include/linux \
    && ln -s /usr/include/x86_64-linux-gnu/asm /usr/local/musl/include/asm \
    && ln -s /usr/include/asm-generic /usr/local/musl/include/asm-generic

WORKDIR /usr/src/busybox-${BUSYBOX_VERSION}
ADD busybox-${BUSYBOX_VERSION}.config .config
RUN make \
    && make install

FROM scratch
COPY --from=builder /build/bin/busybox /
ENTRYPOINT ["/busybox"]
