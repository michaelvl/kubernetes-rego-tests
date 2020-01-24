package main

import data.kubernetes

name = input.metadata.name

kind = input.kind

is_http_proxy {
	kind = "HTTPProxy"
}

virtualhost[host] {
	is_http_proxy
	host = input.spec.virtualhost.fqdn
}

warn[msg] {
	virtualhost[host]
	msg = sprintf("The %s %s is a top-level proxy for %s", [kind, name, host])
}
