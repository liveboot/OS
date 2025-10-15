{ lib, ... }:
{
  image = {
    baseName = lib.mkForce "liveboot";
  };
  isoImage = {
    volumeID = "Liveboot";
    squashfsCompression = "gzip -Xcompression-level 1";
  };
}
