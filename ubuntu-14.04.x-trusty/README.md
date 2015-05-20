# Howto

## Local build

```
$ packer build \
-var "virtualbox_version=`VBoxManage --version`" \
-var 'iteration=X' \
template.json
```

## Atlas

```
$ packer push template.json
```
