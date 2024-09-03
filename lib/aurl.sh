function aurl() {
  dir=`pwd`
  pkg="$1"
  uri="https://aur.archlinux.org/cgit/aur.git/snapshot/$pkg.tar.gz"

  curl -Lo "$pkg".tgz "$uri"
  tar -xf "$pkg".tgz
  pushd "$pkg"
    makepkg -sric --noconfirm
  popd
}
