#!/bin/sh

set -e

chmod +x gradlew
sh -c "./gradlew $*"
