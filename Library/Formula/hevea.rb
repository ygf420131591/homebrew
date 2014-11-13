require "formula"

class Hevea < Formula
  homepage "http://hevea.inria.fr/"
  url "http://hevea.inria.fr/distri/hevea-2.19.tar.gz"
  sha1 "59c0d35819c83b6558490b36f1113cdb4d49e919"

  bottle do
    revision 1
    sha1 "c621f678b16b718d8bbc24470ca207d0fe4c0308" => :mavericks
    sha1 "44b2489966166404d8fd2db1037481a56fa183e3" => :mountain_lion
    sha1 "3e788ceb7a493edfd1c0fc2911e58fe39a55d6de" => :lion
  end

  depends_on "objective-caml"
  depends_on "ghostscript" => :optional

  def install
    ENV["PREFIX"] = prefix
    system "make"
    system "make", "install"
  end

  test do
    (testpath/"test.tex").write <<-EOS.undent
      \\documentclass{article}
      \\begin{document}
      \\end{document}
    EOS
    system "#{bin}/hevea", "test.tex"
  end
end
