#!/bin/bash

function usage() {
    echo "Usage: `basename $0` [-h|--help] [[-b|--blueprints BLUEPRINT]...]"
    echo "       -h, --help             this help message"
    echo "       -b, --blueprint        name of the blueprint"
    echo ""
}

EXIT_CODE=0

function run_test() {
    ./xl-yaml-test --local-repo-path $(pwd) --blueprint-directory $1 --test-path "$1/__test__"
    local TMP_EXIT_CODE=$?
    if [ $TMP_EXIT_CODE -ne 0 ]; then
        EXIT_CODE=$TMP_EXIT_CODE
    fi
}

function handle_args() {
    local BLUEPRINTS=()

    while [[ $# -gt 0 ]]; do
        arg=$1
        case $arg in
            -h|--help)
                usage
                shift
                ;;
            -b|--blueprint)
                shift
                local BP_PATH=$1
                BLUEPRINTS+=("${BP_PATH%/}")
                shift
                ;;
            *)
                usage
                shift
                ;;
        esac
    done

    if [ "${#BLUEPRINTS[@]}" -gt 0 ]; then
        for bp in "${BLUEPRINTS[@]}"; do
            if [ ! -d $bp ]; then
                echo "Directory $bp does not exist. Exiting."
                exit 1
            fi
        done

        echo "Limit integration tests to:"
        for test in "${BLUEPRINTS[@]}"; do
            echo "- $test"
        done

        echo ""

        for test in "${BLUEPRINTS[@]}"; do
            run_test $test
        done
    fi
}

function find_all_blueprint_tests() {
    local BLUEPRINTS=()
    local DIRS=($(find . -name blueprint.yaml | sed 's#^\./##' | sort))
    for fn in "${DIRS[@]}"; do
        dir=$(dirname $fn)
        if [ -d "$dir/__test__" ]; then
            BLUEPRINTS+=("$dir")
        fi
    done

    for test in "${BLUEPRINTS[@]}"; do
        run_test $test
    done
}

function setup_aws_environment() {
    if [ ! -d $HOME/.aws ]; then
        mkdir $HOME/.aws
        echo $'[default]\naws_access_key_id = ABCDEFGHIJKLMNOPQRST\naws_secret_access_key = 1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcd' > $HOME/.aws/credentials
    fi
}

setup_aws_environment

if [ $# -gt 0 ]; then
    handle_args $*
else
    find_all_blueprint_tests
fi

exit $EXIT_CODE
