package policy["com.styra.kubernetes.validating"].rules.rules

monitor[decision] {
  data.library.v1.kubernetes.admission.workload.v1.block_privileged_mode[message]

  decision := {
    "allowed": false,
    "message": message
  }
}
