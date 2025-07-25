{
  perSystem =
    { pkgs, ... }:
    {
      formatter = pkgs.treefmt.withConfig {
        runtimeInputs = with pkgs; [
          nixfmt-rfc-style
          # prettier
          # eslint
        ];

        settings = {
          on-unmatched = "info";
          tree-root-file = "flake.nix";

          formatter = {
            nixfmt = {
              command = "nixfmt";
              includes = [ "*.nix" ];
            };
            # prettier = {
            #   command = "prettier";
            #   includes = [
            #     "*.html"
            #     "*.css"
            #     "*.js"
            #     "*.ts"
            #     "*.svelte"
            #     "*.json"
            #   ];
            # };
            #   eslint = {
            #     command = "eslint";
            #     includes = [
            #       "*.html"
            #       "*.css"
            #       "*.js"
            #       "*.ts"
            #       "*.svelte"
            #       "*.json"
            #     ];
            #   };
          };
        };
      };
    };
}
