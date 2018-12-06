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
    khal
    khard
    ranger
    vdirsyncer    # khal and khard synchronizer

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
    pandoc
    tetex
    rPackages.knitr

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
    idris
    llvm
    #nix-repl
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
    termite
    tree

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
    compton
    ## misc
    redshift
    pywal

    # web browsers
    firefox
    qutebrowser
    w3m

    # misc
    libnotify
    openjdk
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
