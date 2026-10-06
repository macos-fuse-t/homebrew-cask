cask "fuse-t" do
  version "1.2.9"
  sha256 "a1b893740ded8ea034f1acc522ded1144f4a567a1f416daef8c1441cf2662f7f"

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
