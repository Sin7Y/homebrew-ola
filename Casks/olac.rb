cask "olac" do
    arch = Hardware::CPU.intel? ? "intel" : "arm"

    if Hardware::CPU.intel?
        sha256 "e11841691ba79aa529cb442040f85996aa9476db72aaf44a1c6004baca297e45"
    else
        sha256 "f8182bbbfa6d8acf01c24977241cc1a020c9b6f5851360c31bff238a374d76a8"
    end

    version "0.1.1"
    url "https://github.com/Sin7Y/ola-lang/releases/download/v#{version}/olac-mac-#{arch}"
    name "Olac"
    desc "Olac is Ola language compiler."
    homepage "https://olang.readthedocs.io/en/latest/"

    preflight do
        system "xattr", "-d",  "com.apple.quarantine", "#{staged_path}/olac-mac-#{arch}"
    end

    binary "olac-mac-#{arch}", target: "olac"

end
