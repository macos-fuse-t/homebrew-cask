cask "scorpi" do
  version "1.0.3"
  sha256 "4b1b31bbd0637175931dd9417d5f12655ebf9289336b8ef21eedeaf1f9166ac4"

  url "https://github.com/macos-fuse-t/scorpi/releases/download/#{version}/scorpi-macos-installer-#{version}.pkg"
  name "Scorpi"
  desc "Platform for reproducible Linux and Windows VM environments"
  homepage "https://fuse-t.org/scorpi"

  pkg "scorpi-macos-installer-#{version}.pkg"

  uninstall quit:    "scorpi.fuse-t.org",
            delete:  "/usr/local/bin/scorpi",
            pkgutil: "scorpi.fuse-t.org.app"
end
