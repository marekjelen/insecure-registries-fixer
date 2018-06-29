# Insecure registries fixer

Adds insecure registries into Docker configuration from within the container

```
docker run \
  -v /var/run/dbus:/var/run/dbus -v /run/systemd:/run/systemd -v /etc/docker:/root/docker \
  -e REGISTRIES="10.0.0.0/8" \
  mjelen/insecure-registries-fixer
```

and restarts Docker.

## Specifying registries

Registries to be add are specified using ENV variable `REGISTRIES` and is provided as `;` delimited string, e.g.

```
REGISTRIES="10.0.0.0/8"
REGISTRIES="192.168.0.0/16;10.0.0.0/8"
```

## License

Available as open source under the terms of the MIT License.