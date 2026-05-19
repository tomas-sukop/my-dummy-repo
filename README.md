# Jenkins Starter Repository

This repository is a minimal Jenkins-compatible starter project. It contains a declarative `Jenkinsfile` and a portable shell smoke test.

## Files

- `Jenkinsfile` defines the Jenkins pipeline.
- `scripts/smoke-test.sh` is the test command Jenkins runs.
- `tests/validate-repo.sh` checks that the repository scaffold is complete.
- `.gitignore` excludes local and generated files.

## Jenkins Job Setup

Create a Jenkins Pipeline job and point it at this repository.

Recommended job settings:

- Definition: `Pipeline script from SCM`
- SCM: `Git`
- Script Path: `Jenkinsfile`

The pipeline validates the repository, runs the smoke test, and archives logs from `build/logs/`.

## Local Verification

Run the same basic checks locally:

```sh
tests/validate-repo.sh
scripts/smoke-test.sh
```
