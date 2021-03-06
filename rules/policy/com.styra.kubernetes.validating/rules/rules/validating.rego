package policy["com.styra.kubernetes.validating"].rules.rules

monitor[decision] {
  data.library.v1.kubernetes.admission.workload.v1.block_privileged_mode[message]

  decision := {
    "allowed": false,
    "message": message
  }
}
monitor[decision] {
  parameters := {
    "container_port_numbers": {
      "1111"
    }
  }

  data.library.v1.kubernetes.admission.network.v1.restricts_container_ports[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}
not_configured[decision] {
  parameters :=   {
    "prohibited_name_prefixes": set()
  }

  data.library.v1.kubernetes.admission.rbac.v1.deny_role_name_blacklist_prefix[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}
