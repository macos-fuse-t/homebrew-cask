class SshfsFuseT < Formula
  desc "SSHFS implementation built against fuse-t's installed libfuse3"
  homepage "https://github.com/macos-fuse-t/sshfs"
  url "https://codeload.github.com/macos-fuse-t/sshfs/tar.gz/refs/heads/libfuse3"
  version "libfuse3"
  sha256 "41d15aced910eb3ea0de47cfda1ec25a4207a9f786b6fcd81ef92ddf9963fb14"
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
