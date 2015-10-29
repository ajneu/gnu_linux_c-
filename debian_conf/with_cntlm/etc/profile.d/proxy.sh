#!/usr/bin/env bash

CNTLM_HOST=localhost
CNTLM_PORT=3128
export http_proxy=http://${CNTLM_HOST}:${CNTLM_PORT}
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
