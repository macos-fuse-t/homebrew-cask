cask "fuse-t" do
  version "1.2.7"
  sha256 "6a29c747e61a86a405a189efc3de42812d73147135f93a1bb0624c1e7b90e654"

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
