class Mkfontscale < Formula
  desc "X.Org Applications: mkfontscale"
  homepage "https://www.x.org/"
  ### http://www.linuxfromscratch.org/blfs/view/svn/x/x7app.html
  url "https://www.x.org/pub/individual/app/mkfontscale-1.2.1.tar.bz2"
  sha256 "ca0495eb974a179dd742bfa6199d561bda1c8da4a0c5a667f21fd82aaab6bac7"
  # tag "linuxbrew"

  bottle do
    cellar :any_skip_relocation
    sha256 "895415a5b7edc441ba8d8fc51dc4ac3e51d3e077d8dc59befe199b6db0cfc15a" => :x86_64_linux
  end

  depends_on "linuxbrew/xorg/xorgproto" => :build
  depends_on "pkg-config" => :build
  depends_on "freetype"
  depends_on "linuxbrew/xorg/libfontenc"
  depends_on "bzip2" => :recommended

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
      --with-bzip2=#{build.with?("bzip2") ? "yes" : "no"}
    ]

    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
