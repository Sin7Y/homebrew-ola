cask "olac" do
    arch = Hardware::CPU.intel? ? "intel" : "arm"

    if Hardware::CPU.intel?
        sha256 "5332e1947eaf0b2bfe0b9213909b40f902c38b8c4010d357292e6fc36e0703ad"
    else
        sha256 "38c988521a84c0276a0ec65431ac1b9dcb8452c634af6aa5de3e5632f1cdd204"
    end

    version "1.0.0"
    url "https://github.com/Sin7Y/ola-lang/releases/download/v#{version}/olac-mac-#{arch}"
    name "Olac"
    desc "Olac is Ola language compiler."
    homepage "https://olang.readthedocs.io/en/latest/"

    preflight do
        system "xattr", "-d",  "com.apple.quarantine", "#{staged_path}/olac-mac-#{arch}"
    end

    binary "olac-mac-#{arch}", target: "olac"

end