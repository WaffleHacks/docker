cat > ./Corefile << EOF
. {
  redis . {
    address $REDIS_URL
    prefix $REDIS_PREFIX
    ttl 60
  }
  forward . $FALLBACK_DNS

  ready
  health
  prometheus

  log
  errors
  cache
}
EOF

exec /coredns
