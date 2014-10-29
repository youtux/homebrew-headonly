require "formula"

class Theos < Formula
  homepage "http://theos.howett.net/"
  head "https://github.com/DHowett/theos.git"

  depends_on "ldid" => :build

  def install
    libexec.install Dir['*']
  end

  def caveats; <<-EOS.undent
    The home of THEOS is:
      #{opt_libexec}
    You may want to add the following to your .bash_profile:
      export THEOS=#{opt_libexec}
    EOS
  end

  test do
    system "#{opt_libexec}/bin/bootstrap.sh", "version-p"
  end
end
