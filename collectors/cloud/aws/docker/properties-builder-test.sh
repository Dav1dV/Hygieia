export PROP_FILE=/tmp/zapp.props

log() {
  echo -e "\n\n\n$1"
}

# Defaults
log Defaults:
./properties-builder.sh

# Overrides
log Overrides:
export AWS_CRON=cron
export AWS_PROXY_HOST=proxy_host
export AWS_PROXY_PORT=proxy_port
export AWS_NON_PROXY=non_proxy
export AWS_PROFILE=prof
export AWS_VALID_TAG_KEY=uno
export AWS_VALID_TAG_KEY1=dos
./properties-builder.sh
