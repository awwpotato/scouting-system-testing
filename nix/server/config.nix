{ pkgs, ... }:
{
  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    curl
    git
    killall
    nh
    ripgrep
    tree
    vim
    wget
  ];

  services = {
    openssh.enable = true;
  };
}
