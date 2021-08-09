class Brewtapdemo < Formula
  desc "Demonstrates how to create a third-party Homebrew Tap + Formulae"
  homepage "https://github.com/AbePralle"
  url "https://github.com/AbePralle/BrewTapDemo/archive/refs/tags/v1.0.tar.gz"
  sha256 "89664b3259b279587c990aa19255b40235648d63dcbe35d010a770eb47061856"
  license "MIT"

  depends_on "make" => :build

  def install
    system "make", "homebrew", "INSTALL_FOLDER=#{prefix}"
  end

  test do
    assert_equal "Hello World!", shell_output("#{bin}/brewtapdemo").strip
  end
end
