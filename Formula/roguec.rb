# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Roguec < Formula
  desc "The Rogue Language compiler"
  homepage "https://github.com/AbePralle/Rogue"
  url "https://github.com/AbePralle/Rogue/archive/refs/tags/v1.8.7.tar.gz"
  sha256 "eb5f5b8ecc091d24091ebb5b63fb4202d1b170bc84dcdc7b6a35f65c93987b7f"
  license ""

  depends_on "make" => :build

  def install
    system "make", "homebrew", "INSTALL_FOLDER=#{prefix}"
  end

  test do
    (testpath/"Test.rogue").write "println \"Hello World!\"\n"
    system "roguec", testpath/"Test.rogue", "--compile"
    assert_equal "Hello World!\n", shell_output("#{testpath}/test")
  end
end
