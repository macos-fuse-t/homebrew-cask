cask "scorpi" do
  version "1.0.1"
  sha256 "3e46e1c2049691f9d71093b9cdc70c339bfc3c1f41d8ff16485504936d3f1208"

  url "https://github.com/macos-fuse-t/scorpi/releases/download/#{version}/scorpi-macos-installer-#{version}.pkg"
  name "Scorpi"
  desc "Platform for reproducible Linux and Windows VM environments"
  homepage "https://fuse-t.org/scorpi"

  pkg "scorpi-macos-installer-#{version}.pkg"

  uninstall quit:    "scorpi.fuse-t.org",
            delete:  "/usr/local/bin/scorpi",
            pkgutil: "scorpi.fuse-t.org.app"
end
