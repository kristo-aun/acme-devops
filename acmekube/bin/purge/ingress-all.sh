#!/usr/bin/env bash

helm delete --purge ingress-int-release
helm delete --purge ingress-ext-release
