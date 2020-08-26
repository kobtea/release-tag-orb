# Release Tag Orb

This CircleCI Orb watches the `VERSION` file, and if the tag with the same name does not exist yet, create one.

## Usage

### Requirements

This orb expects

- `VERSION` file exists at root directory of a repository
- `VERISON` file contains only SemVer string

## Example jobs

The following example will create `v1.0.0` tag at GitHub repository.

```bash
$ cat VERSION
1.0.0
```

```yaml
version: 2.1
orbs:
  release-tag: kobtea/release-tag@volatile

workflows:
  version: 2
  tagging:
    jobs:
      - release-tag/tagging:
          fingerprint: << FINGERPRINT_FOR_DEPLOY_KEY >>
```

The following example will create `v1` tag, such a stable release.
Every time this job is triggered, this `v1` tag will override.

```yaml
version: 2.1
orbs:
  release-tag: kobtea/release-tag@volatile

workflows:
  version: 2
  tagging:
    jobs:
      - release-tag/tagging-major:
          fingerprint: << FINGERPRINT_FOR_DEPLOY_KEY >>
```
