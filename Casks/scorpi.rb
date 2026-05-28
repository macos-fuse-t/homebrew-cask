cask "scorpi" do
  version "1.0.6"
  sha256 "4b1a962d144fa3e3d4f9dc31091299f465866f435a0b8c13380fc5988f844ee7"

  url "https://github.com/macos-fuse-t/scorpi/releases/download/#{version}/scorpi-macos-installer-#{version}.pkg"
  name "Scorpi"
  desc "Platform for reproducible Linux and Windows VM environments"
  homepage "https://fuse-t.org/scorpi"

  pkg "scorpi-macos-installer-#{version}.pkg"

  uninstall quit:    "scorpi.fuse-t.org",
            delete:  "/usr/local/bin/scorpi",
            pkgutil: "scorpi.fuse-t.org.app"
end
