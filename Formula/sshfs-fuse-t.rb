class SshfsFuseT < Formula
  env :std

  desc "SSHFS implementation built against fuse-t's installed libfuse3"
  homepage "https://github.com/macos-fuse-t/sshfs"
  url "https://codeload.github.com/macos-fuse-t/sshfs/tar.gz/6fd1ee78d009a8962c801e22d4afca0c4e4dc5af"
  version "2026.05.12-6fd1ee7"
  sha256 "0db74b09f60c2084b23c282e2b6b3f7d415e7ad5f99439c9f18d6acff73fa2ab"
  license "GPL-2.0-or-later"

  depends_on "glib"
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build

  def install
    fuse_t_prefix = Pathname("/Library/Application Support/fuse-t")
    fuse3_pc = fuse_t_prefix/"pkgconfig/fuse3.pc"

    unless fuse3_pc.exist?
      odie <<~EOS
        fuse-t with libfuse3 was not found.

        Install fuse-t first:
          brew install --cask fuse-t

        Expected pkg-config file:
          #{fuse3_pc}
      EOS
    end

    ENV["PKG_CONFIG"] = Formula["pkgconf"].opt_bin/"pkg-config"
    ENV.prepend_path "PATH", Formula["pkgconf"].opt_bin
    ENV.prepend_path "PKG_CONFIG_PATH", fuse3_pc.dirname
    ENV.append "LDFLAGS", "-Wl,-rpath,/usr/local/lib"

    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build"
    system "meson", "install", "-C", "build"

    sbin.install_symlink bin/"sshfs" => "mount.sshfs"
    sbin.install_symlink bin/"sshfs" => "mount.fuse.sshfs"
  end

  test do
    assert_match "SSHFS version", shell_output("#{bin}/sshfs -V 2>&1")
  end
end
