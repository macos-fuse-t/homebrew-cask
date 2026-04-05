cask "fuse-t" do
  version "1.2.1"
  sha256 "77e0feca3d5a3dde5bd2683b1613fb52f23385381e41b9f47216dcc88644a346"

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
