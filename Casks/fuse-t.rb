cask "fuse-t" do
  version "1.2.0"
  sha256 "6e21e4fcf072a8cd41e13bed080289531621e35a5f484d81ac7953f6bd3cd8d2"

  url "https://github.com/macos-fuse-t/fuse-t/releases/download/#{version}/fuse-t-macos-installer-#{version}.pkg"
  name "fuse-t"
  desc "LibFUSE implementation that doesn't use kernel extensions"
  homepage "https://github.com/macos-fuse-t/fuse-t"

  pkg "fuse-t-macos-installer-#{version}.pkg"

  uninstall delete: "/Applications/fuse-t.app",
            pkgutil: [
              "org.fuse-t.*",
              "org.fuse-t.core.*",
              "org.fuse-t.fskit.*",
            ]

  caveats do
    license "https://github.com/macos-fuse-t/fuse-t/blob/main/License.txt"
  end
end
