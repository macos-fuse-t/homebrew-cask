cask "fuse-t-sshfs" do
  version "1.0.2"
  sha256 "8875fe7a932893cef6333288ccf6f6e3844d3fd6825ea39e878b020466d259ca"

  url "https://github.com/macos-fuse-t/sshfs/releases/download/#{version}/sshfs-macos-installer-#{version}.pkg"
  name "sshfs"
  desc "SSHFS implementation based on FUSE-T"
  homepage "https://github.com/macos-fuse-t/sshfs"

  pkg "sshfs-macos-installer-#{version}.pkg"

  depends_on cask: "fuse-t"
end
