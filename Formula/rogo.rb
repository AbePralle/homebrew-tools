class Rogo < Formula
  desc "Rogue-based build system"
  homepage "https://github.com/AbePralle/Rogo"
  url "https://github.com/AbePralle/Rogo/archive/refs/tags/v1.0.tar.gz"
  sha256 "992fa01d575d9e1ad9d8a81c20f0b660975f9fbc78a629ac55759757116db1a9"
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
