{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # config = {
  #   allowUnfree = true;
  #   allowBroken = false;
  #   allowInsecure = false;
  #   allowUnsupportedSystem = false;
  # };

  nixpkgs.overlays = [
    (self: super: {
      cairo = super.cairo.overrideAttrs(oa: rec {
        configureFlags = [
          "--enable-tee"
        ] ++ oa.configureFlags;
      });
    })
  ];


  # Packages to install
  home.packages = [
    pkgs.neo-cowsay
    pkgs.age
    pkgs.asdf-vm
    pkgs.bat
    pkgs.neovim
    # pkgs.act
    pkgs.direnv
    pkgs.exa
    pkgs.fd
    pkgs.fzf
    pkgs.gh
    pkgs.gnugrep
    pkgs.gnused
    pkgs.jq
    pkgs.jrnl
    pkgs.python39
    pkgs.python39Packages.pip
    pkgs.python39Packages.pipx
    pkgs.python39Packages.virtualenv
    pkgs.python39Packages.virtualenvwrapper
    pkgs.restic
    pkgs.ripgrep
    pkgs.sops
    # pkgs.tmux # outdated
    pkgs.yq-go
    pkgs.aspell
    pkgs.awscli2
    pkgs.coreutils
    pkgs.diff-so-fancy
    pkgs.exiftool
    pkgs.git
    pkgs.git-extras
    pkgs.git-filter-repo
    pkgs.git-lfs
    pkgs.hyperfine
    pkgs.micro
    pkgs.pandoc
    pkgs.python39Packages.pipx
    pkgs.prettyping
    pkgs.rename
    pkgs.rsync
    pkgs.sox
    pkgs.python39Packages.send2trash
    pkgs.wget2
    pkgs.youtube-dl-light
    pkgs.zsh
    # pkgs.docker
    # pkgs.docker-client
    pkgs.fira-code
    # pkgs.nerdfonts # this has every font and is huge (>2G)
    pkgs.qmk
    pkgs.gqview
    pkgs.pv
    pkgs.less
    pkgs.zstd
    pkgs.parallel
    # pkgs.moreutils #conflicts with parallel
    pkgs.vivid
    pkgs.as-tree
    pkgs.vivid
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jonathan";
  home.homeDirectory = "/Users/jonathan";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}

