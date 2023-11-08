cask "olac" do
    arch = Hardware::CPU.intel? ? "intel" : "arm"

    if Hardware::CPU.intel?
        sha256 "8593e52abfcc76659a75d2a9781b7e332f913d094b67ca7150e54bd25a780069"
    else
        sha256 "99fe22f586a4c9f5da5d465a49fed4ae3ee8a71355a882f073db797b33a9dbd8"
    end

    version "0.1.0"
    url "https://github.com/Sin7Y/ola-lang/releases/download/v#{version}/olac-mac-#{arch}"
    name "Olac"
    desc "Olac is Ola language compiler."
    homepage "https://olang.readthedocs.io/en/latest/"

    preflight do
        system "xattr", "-d",  "com.apple.quarantine", "#{staged_path}/olac-mac-#{arch}"
    end

    binary "olac-mac-#{arch}", target: "olac"

end
