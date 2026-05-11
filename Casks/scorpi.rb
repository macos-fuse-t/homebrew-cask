cask "scorpi" do
  version "1.0.1"
  sha256 "e3a63a67d2e248c1849254556018ff158ef5762499cc8a63c5d46669f413caa8"

  url "https://github.com/macos-fuse-t/scorpi/releases/download/#{version}/scorpi-macos-installer-#{version}.pkg"
  name "Scorpi"
  desc "Platform for reproducible Linux and Windows VM environments"
  homepage "https://fuse-t.org/scorpi"

  preflight do
    expanded_pkg = staged_path/"expanded"

    FileUtils.rm_rf expanded_pkg
    system_command "/usr/sbin/pkgutil",
                   args: ["--expand-full", staged_path/"scorpi-macos-installer-#{version}.pkg", expanded_pkg]
    FileUtils.cp_r expanded_pkg/"scorpi-app.pkg/Payload/Scorpi.app", staged_path/"Scorpi.app"
    FileUtils.rm_rf expanded_pkg
    FileUtils.rm_f staged_path/"scorpi-macos-installer-#{version}.pkg"
  end

  app "Scorpi.app"
  binary "#{appdir}/Scorpi.app/Contents/Resources/bin/scorpi"

  uninstall quit: "scorpi.fuse-t.org"
end
