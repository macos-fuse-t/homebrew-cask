cask "fuse-t-sshfs" do
  version "1.0.1"
  sha256 "3e07103cf0480affbdfa61b4891b788a3f9b8e1dd23435fe659d7fccc421b14e"

  url "https://github.com/macos-fuse-t/fuse-t/releases/download/#{version}/sshfs-macos-installer-#{version}.pkg"
  name "sshfs"
  desc "SSHFS implementation based on FUSE-T"
  homepage "https://github.com/macos-fuse-t/sshfs"

  pkg "sshfs-macos-installer-#{version}.pkg"
end
