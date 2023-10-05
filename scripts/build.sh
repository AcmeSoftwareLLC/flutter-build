#!/bin/bash

# Exit on error
set -e

BLUE='\033[0;34m'
NC='\033[0m'

run() {
    echo -e "${BLUE}$1${NC}"
    eval $1
}

run "flutter pub get"

treeShake="true"

while [[ $# -gt 0 ]]; do
    case "$1" in
        --platform=*)
            platform="${1#*=}"
            ;;
        --build-name=*)
            buildName="${1#*=}"
            ;;
        --build-number=*)
            buildNumber="${1#*=}"
            ;;
        --tree-shake=*)
            treeShake="${1#*=}"
            ;;
        --base-href=*)
            baseHref="${1#*=}"
            ;;
        *)
            echo "Invalid argument: $1"
            exit 1
            ;;
    esac
    shift
done


case $platform in
  "android")
    buildMode="appbundle"
    ;;
  "ios")
    buildMode="ios --config-only --no-codesign"
    ;;
  "macos")
    buildMode="macos --config-only"
    ;;
  "web")
    buildMode="web"
    
    ;;
  *)
    echo "Usage: ./build.sh --platform=[android|ios|macos|web]"
    exit 1
    ;;
esac

if [ "$treeShake" != "true" ]; then
    buildMode="$buildMode --no-tree-shake-icons"
fi


if [ "$buildMode" == "web" ]
then
    if [ "$baseHref" != "" ]; then
        buildMode="$buildMode --base-href=$baseHref"
    fi
    run "flutter build $buildMode"
else
    run "flutter build $buildMode --build-name=$buildName --build-number=$buildNumber"
fi
