FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/alidns \
    --with github.com/mholt/caddy-ratelimit

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
