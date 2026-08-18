{ inputs, pkgs, ... }:

{
  imports = [ inputs.nixvim.nixosModules.nixvim ];

  programs.nixvim = {
    enable = true;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    plugins = {
      telescope.enable = true;
      treesitter.enable = true;
      lualine.enable = true;
    };
  };
}
