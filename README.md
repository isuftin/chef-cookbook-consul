# OWI Consul Cookbook

This is a wrapper cookbook around the community Consul cookbook @ https://github.com/johnbellone/consul-cookbook

## Creating Server Certificates ([tl;dr](#creating-server-certificates-tldr))

In order for Consul to use TLS encryption, server certificates must be created. There are certificates included with this project to use with Test Kitchen. But to create new certificates, there are steps outlined to do so here. A custom openssl configuration file is required because a Certificate Authority cert must be created with certain openssl extensions active. 

#### Creating Server Certificates <a name="creating-server-certificates-tldr"></a>tl;dr

```
$ cd test/fixtures/files/certificates
$ touch certindex
$ echo 000a > serial
$ mkdir certs
$ SUBJ="/C=US/ST=Wisconsin/L=Middleon/O=US Geological Survey/OU=WMA/CN=server.kitchen.consul"
$ openssl req -newkey rsa:2048 -days 9999  -x509 -nodes -out consul-root.cer -keyout consul-private.pem -subj "${SUBJ}"
$  openssl req -newkey rsa:1024 -nodes -out consul-server.csr -keyout consul-server.key -subj "${SUBJ}"
$ openssl ca -batch -config openssl.conf -notext -in consul-server.csr -out consul-server.cer
$ cp consul-* ../../..
```
