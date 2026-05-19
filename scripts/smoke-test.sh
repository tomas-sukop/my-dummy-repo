#!/bin/sh
set -eu

printf 'Starting smoke test...\n'

[ -f Jenkinsfile ]
[ -f README.md ]
[ -d scripts ]

printf 'Smoke test passed.\n'
