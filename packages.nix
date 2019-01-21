{ config, lib, pkgs, ... }:

{
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    
    # analysis
    htop
    python36Packages.glances
    iotop
    neofetch
    powertop

    # archive / version control
    git
    unrar
    unzip
    zip

    # desktop utilities
    feh
    khal
    khard
    ranger
    vdirsyncer    # khal and khard synchronizer
    zlib # for taskell

    # communication / rss
    #neomutt
    newsboat
    #notmuch
    #offlineimap
    #profanity    # xmpp client
    #weechat    # irc client

    # editing
    #libreoffice
    (import ./vim.nix)
    zathura
    ## LaTex / md
    biber
    pandoc
    #tetex # may remove
    texlive.combined.scheme-full

    # media
    #cava    # music visualizer
    #slrn    # newsreader client
    #youtube-dl
    ## mopidy
    #mopidy
    #mopidy-gmusic
    #mopidy-soundcloud
    #mopidy-spotify
    ## mpd
    #mpd
    #ncmpcpp
    ## mpv
    #mpv
    #mpvc

    # network
    nmap
    #quagga
    traceroute
    wget
    whois
    #wireshark

    # programming
    clang
    dialog
    ghc
    haskellPackages.ghcid
    haskellPackages.hnix
    haskellPackages.stack
    #haskellPackages.vcard
    idris
    llvm
    #nix-repl
    nodejs
    python27Full
    python36Full
    python37Full
    zsh


    # security                                                                                                                
    #aircrack-ng
    #clamav
    #clamsmtp
    gnupg
    gnutls
    #john
    #kpcli    # password manager
    #lynis  # needs nixos patch
    #metasploit
    #pam
    #snort    #id/ip
    #thc-hydra

    # system utilities
    psmisc
    tree
    tmpwatch

    # window manager
    cairo # required by i3lock
    dmenu
    i3-gaps
    i3blocks-gaps
    i3lock
    i3status
    xbrightness
    xorg.libxcb
    xorg.pixman
    xorg.xbacklight
    xorg.xcbutilerrors
    xorg.xcbutilimage
    xorg.xcbutilwm
    xorg.xinit
    ## transparency
    #compton
    ## misc
    redshift
    pywal

    # web browsers
    firefox
    #w3m

    # misc
    libnotify
    openjdk
    scrot
    wine
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    #bash.enableCompletion = true;
    mtr.enable = true;
    gnupg.agent = { enable = true; enableSSHSupport = true; };
    zsh.enable = true;
  };
}
