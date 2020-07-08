vcl 4.0;

backend default {
  .host = "example.com";
  .port = "80";
}

backend blog {
  .host = "www.gatsbyjs.org";
  .port = "443";
}

sub vcl_recv{
  if (req.url ~ "^/blog/") {
    set req.backend_hint = blog;
    set req.http.host = "www.gatsbyjs.org";
    return (hash);
  } else {
    set req.http.host = "example.com";
    set req.backend_hint = default;
  }
}