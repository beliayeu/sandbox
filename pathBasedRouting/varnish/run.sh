docker rm --force varnish
docker run --name varnish \
    -v ${PWD}/default.vcl:/etc/varnish/default.vcl:ro \
    --tmpfs /var/lib/varnish:exec \
    -p 8080:80 \
    -p 8081:443 \
    varnish