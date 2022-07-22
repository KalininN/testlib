#!/bin/bash
set -eo pipefail

TESTS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
export TESTS_DIR="$TESTS_DIR"
export INVOCATION_ID=$RANDOM

echo Running tests
echo ""

for test_dir in "$TESTS_DIR"/*/; do
  test=$(basename "$test_dir")
  if [[ $test == test-* ]]; then
    echo Running "${test}" ...
    export TEST_DIR="$test_dir"
    export INCLUDE=${TESTS_DIR}/..
    pushd "$test_dir" 1>/dev/null 2>&1
    bash "${test_dir}run.sh"
    echo Done "${test}"
    echo ""
    popd 1>&2 1>/dev/null 2>&1
  fi
done

rm -rf "$TESTS_DIR"/tester-lcmp
echo Done all tests
echo ""
