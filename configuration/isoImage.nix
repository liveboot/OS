{ lib, ... }:
{
  image = {
    baseName = lib.mkForce "liveboot";
  };
  isoImage = {
    volumeID = "Liveboot";
    squashfsCompression = "lz4";
  };
}
