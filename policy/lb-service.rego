package main

import data.kubernetes

name = input.metadata.name

warn[msg] {
  kubernetes.is_service
  input.spec.type = "LoadBalancer"
  msg = sprintf("Found service %s of type %s", [name, input.spec.type])
}
