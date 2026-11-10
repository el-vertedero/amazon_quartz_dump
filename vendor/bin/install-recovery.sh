#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/soc/11230000.mmc/by-name/recovery$(getprop ro.boot.slot_suffix):41943040:379ac52dcbba44cb6a60520d7a33ff016bb4aeb0; then
  applypatch --bonus /vendor/etc/recovery-resource.dat \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/soc/11230000.mmc/by-name/boot$(getprop ro.boot.slot_suffix):33554432:634526482fefd714eac0e3b475aa5ead56f837af \
          --target EMMC:/dev/block/platform/soc/11230000.mmc/by-name/recovery$(getprop ro.boot.slot_suffix):41943040:379ac52dcbba44cb6a60520d7a33ff016bb4aeb0 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
