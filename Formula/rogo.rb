class Rogo < Formula
  desc "Rogue-based build system"
  homepage "https://github.com/AbePralle/Rogo"
  url "https://github.com/AbePralle/Rogo/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "29a3747c3ff374f5c9b00a07af8b7ea4a53e796a82a760e2fac78444813580b1"
  license "MIT"

  depends_on "abepralle/tools/roguec"
  depends_on "make"   => :build

  def install
    system "make", "homebrew", "INSTALL_FOLDER=#{prefix}"
  end

  test do
    (testpath/"Build.rogue").write <<~EOS
      println "Rogo installation success"
    EOS
    cd testpath do
      system "rogo" # run once to avoid build executable compile logs
      assert_equal "Rogo installation success", shell_output("rogo").strip
    end
  end
end
