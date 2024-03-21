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
        --env-file=*)
            envFile="${1#*=}"
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
    buildMode="ios --no-codesign --config-only"
    if [ "$RUNNER_OS" != "macOS" ]; then
        echo "Platform 'ios' is only supported on macOS."
        exit 1
    fi
    ;;
  "macos")
    buildMode="macos --config-only"
    if [ "$RUNNER_OS" != "macOS" ]; then
        echo "Platform 'macos' is only supported on macOS."
        exit 1
    fi
    ;;
  "web")
    buildMode="web"
    ;;
  *)
    echo "Usage: ./build.sh --platform=[android|ios|macos|web]"
    exit 1
    ;;
esac

buildCommand="flutter build $buildMode"

if [ "$buildMode" == "web" ]
then
    if [ "$baseHref" != "" ]; then
        buildCommand="$buildCommand --base-href=$baseHref"
    fi
else
    buildCommand="$buildCommand --build-name=$buildName --build-number=$buildNumber"
fi

if [ "$treeShake" != "true" ]; then
    buildCommand="$buildCommand --no-tree-shake-icons"
fi

if [ "$envFile" != "" ]; then
    buildCommand="$buildCommand --dart-define-from-file=$envFile"
fi

run "$buildCommand"
