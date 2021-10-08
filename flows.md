# Developer Flows

## Register new service

## Release new image tag

### Using a CLI

[draw.io](./flows/release-new-version.drawio.svg)

For demostration purposes we're using GitHub Actions so we're integrate with gh cli and we suppose all steps success to simplify workflow descriptions

1. From the terminal we initiate a github manual workflow

```sh
> gh workflow run --name="New Image Tag" --environment="development" --ship="developer-experience" --service="rollouts-demo" --tag="v1.0.0"
```

2. As a result:

  - A new PR is created with the tag change needed
  - PR will run checks: tests and validations as any other code on the repository
  - PR will be auto-merged if checks are successful

3. If PR is merged and released onto kubernetes cluster




