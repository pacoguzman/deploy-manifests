# Deploy Manifests

This repository try to adhere to GitOps methodology following these concepts:

- Infrastructure as Code: Git is always the source of truth on what happens in the system
- Code changes always go through an automated process
- Deployments, tests, and rollbacks controlled through Git flow
- Integration with secrets providers
- No hand-rolled deployments: If you want to change the state you need to perform a Git operation such as creating a commit or opening a pull request

## Architecture

## User flows

1. Register a new service

Currently, the build platform team will help to register new services describing the whole process in [register a new service](./flows/register-a-new-service.md)

TODO: Automatize

2. Release a new version

To release a new version of an already registered service, users should follow the process describe in [release a new version](./flows/release-a-new-version.md)
