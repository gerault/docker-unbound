# Builder image
ARG IMAGE_TAG
FROM debian:bullseye-backports as builder

RUN apt update && \
    apt install -y curl=7.74.0-1.3+deb11u3

# generate adsblock.conf file with all hosts to blacklist
RUN echo "server:" > /tmp/adsblock.conf
RUN curl -f -L -i https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts \
    | grep '^0\.0\.0\.0' \
    | awk '{print "  local-zone: \""$2"\" redirect\n  local-data: \""$2" A 0.0.0.0\""}' >> /tmp/adsblock.conf

# retrieve latests root hints
RUN curl -f -L -i https://www.internic.net/domain/named.root -o /tmp/root.hints


# Final Image
FROM docker.io/klutchell/unbound:${IMAGE_TAG}

WORKDIR /etc/unbound/custom.conf.d
COPY --from=builder /tmp/adsblock.conf .

WORKDIR /etc/unbound
COPY --from=builder /tmp/root.hints .
