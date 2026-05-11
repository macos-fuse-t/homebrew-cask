cask "scorpi" do
  version "1.0.1"
  sha256 "e3a63a67d2e248c1849254556018ff158ef5762499cc8a63c5d46669f413caa8"

  url "https://github.com/macos-fuse-t/scorpi/releases/download/#{version}/scorpi-macos-installer-#{version}.pkg"
  name "Scorpi"
  desc "Platform for reproducible Linux and Windows VM environments"
  homepage "https://fuse-t.org/scorpi"

  pkg "scorpi-macos-installer-#{version}.pkg"

  uninstall quit:    "scorpi.fuse-t.org",
            delete:  [
              "/Applications/Scorpi.app",
              "/usr/local/bin/scorpi",
            ],
            pkgutil: "scorpi.fuse-t.org.app"
end
