{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      wpilibsuite.vscode-wpilib ];
    };
  home.packages = [ pkgs.cpplint ];
}
