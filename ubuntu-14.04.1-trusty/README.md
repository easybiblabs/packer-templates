# Howto

## Local build

```
$ packer build \
-var "virtualbox_version=${VBOXManage --version}" \
-var 'iteration=X' \
template.json
```

## Atlas

```
$ packer push template.json
```
