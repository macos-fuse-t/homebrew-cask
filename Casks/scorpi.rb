cask "scorpi" do
  version "1.0.2"
  sha256 "c44b6ab88eb635042368f8f56155a24f850e26af31165b8cdb52f79a0d4e4b8a"

  url "https://github.com/macos-fuse-t/scorpi/releases/download/#{version}/scorpi-macos-installer-#{version}.pkg"
  name "Scorpi"
  desc "Platform for reproducible Linux and Windows VM environments"
  homepage "https://fuse-t.org/scorpi"

  pkg "scorpi-macos-installer-#{version}.pkg"

  uninstall quit:    "scorpi.fuse-t.org",
            delete:  "/usr/local/bin/scorpi",
            pkgutil: "scorpi.fuse-t.org.app"
end
