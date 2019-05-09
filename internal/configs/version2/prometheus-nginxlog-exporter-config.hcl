listen {
  port = 4040
  address = "0.0.0.0"
}

namespace "nginx_exp" {
  format = "$remote_addr - $remote_user [$time_local] \"$request\" $status $body_bytes_sent rt=$request_time urt=\"$upstream_response_time\" \"$http_referer\" \"$http_user_agent\" \"$http_x_forwarded_for\""
  source_files = [
    "/var/log/nginx/access.log"
  ]
  labels {
    app = "nginx-ingress-app"
  }
  upstream_seconds_hist_bucket = [.01, .05, .10, .15, .20, .25, .3, .35, .4, .45, .5, .55, .6, .65, .7, .75, .8, 1, 1.25, 1.5, 2.0, 2.5, 5, 10]
  response_seconds_hist_bucket = [.01, .05, .10, .15, .20, .25, .3, .35, .4, .45, .5, .55, .6, .65, .7, .75, .8, 1, 1.25, 1.5, 2.0, 2.5, 5, 10]
}
