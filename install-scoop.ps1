if (-not(Get-Command scoop)) {
  iex "& {$(irm get.scoop.sh)} -RunAsAdmin";
  scoop install git;
  scoop install starship;
  scoop install volta;
  scoop install sudo;
  scoop bucket add extras;
  sudo scoop install -g CascadiaCode-NF-Mono;
}
