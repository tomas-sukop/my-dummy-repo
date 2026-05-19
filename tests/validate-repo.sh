#!/bin/sh
set -eu

fail() {
  printf 'ERROR: %s\n' "$1" >&2
  exit 1
}

[ -f Jenkinsfile ] || fail "Jenkinsfile is missing"
[ -f README.md ] || fail "README.md is missing"
[ -f .gitignore ] || fail ".gitignore is missing"
[ -f scripts/smoke-test.sh ] || fail "scripts/smoke-test.sh is missing"
[ -x scripts/smoke-test.sh ] || fail "scripts/smoke-test.sh must be executable"

sh -n scripts/smoke-test.sh

grep -q "pipeline" Jenkinsfile || fail "Jenkinsfile should define a declarative pipeline"
grep -q "scripts/smoke-test.sh" Jenkinsfile || fail "Jenkinsfile should run the smoke test"
grep -q "archiveArtifacts" Jenkinsfile || fail "Jenkinsfile should archive build artifacts"

printf 'Repository validation passed.\n'
