
packages {
  development = ["cargo@1.75.0"]
  runtime     = ["cacert@3.95"]
}

rustapp {
  projectName         = "hello-world"
  release             = true
  rustVersion         = ""
  rustToolchain       = ""
  rustChannel         = ""
  rustProfile         = ""
  extraRustComponents = null
}
