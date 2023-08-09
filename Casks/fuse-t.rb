cask "fuse-t" do
  version "1.0.27"
  sha256 "5ae09209131aac304dfad1226e759575392c85238b2e5a8c686d27267cbca34d"

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
