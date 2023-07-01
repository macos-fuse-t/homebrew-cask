cask "fuse-t" do
  version "1.0.22"
  sha256 "7c64a32e00610fb9d01e31b54a341d0bbb8b16c16a488c6810a6bdc8d718d820"

  url "https://github.com/macos-fuse-t/fuse-t/releases/download/#{version}/fuse-t-macos-installer-#{version}.pkg"
  name "fuse-t"
  desc "LibFUSE implementation that doesn't use kernel extensions"
  homepage "https://github.com/macos-fuse-t/fuse-t"

  pkg "fuse-t-macos-installer-#{version}.pkg"

  uninstall script: {
    executable: "/Library/Application Support/fuse-t/uninstall.sh",
    sudo:       true,
  }

  caveats do
    license "https://github.com/macos-fuse-t/fuse-t/blob/main/License.txt"
  end
end
