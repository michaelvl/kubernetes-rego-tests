package main

import data.kubernetes

name = input.metadata.name

kind = input.kind

is_secret {
	kind = "Secret"
}

secret_data_short[sh] {
        is_secret
	sh := [ k | count(input.data[k]) < 20 ]
}

warn[msg] {
        is_secret
	msg = sprintf("%s %s is unsealed", [kind, name])
}

warn[msg] {
	secret_data_short[k]
	k != []
	msg = sprintf("%s %s has short secret data for key(s) %s", [kind, name, k])
}
