# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Brewformulaetest < Formula
  desc ""
  homepage ""
  url "https://github.com/AbePralle/BrewFormulaeTest/archive/refs/tags/v1.5.tar.gz"
  sha256 "33655de08c225fcbe00b70bc2f98102e32a9ce644e341537fd20ab43690723a9"
  license "MIT"

  depends_on "make" => :build

  def install
    system "make", "homebrew", "OUTPUT_FOLDER=#{prefix}"
    #bin.install_symlink "#{bin}/bftest" #=> "wx-config-#{version.major_minor}"
    #bin.install_symlink "#{prefix}/bftest"
  end

  test do
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
