packer-templates
================

These are [packer](http://www.packer.io/) templates for Ubuntu.

## Releasing a new version

 * make changes in the designated `template.json`
 * increment `iteration` in the `template.json`
 * test build the boxes locally
 * make a PR
 * on merge, it will push the new version to Atlas
 * verify: https://atlas.hashicorp.com/ies

Note: at this time, only ubuntu-14.04.x-trusty will be pushed up.

## Building on localhost

```
$ packer build -only=virtualbox-iso template.json
```

Omit `-only` if you have VMware installed also.
