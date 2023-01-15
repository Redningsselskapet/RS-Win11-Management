if (-not(Get-Command scoop)) {
  iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
}
