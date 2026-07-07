{ ... }:
let
  custom = {
    font = "Maple Mono";
    font_size = "18px";
    font_weight = "bold";
    text_color = "#ECF4EE";
    background_0 = "#171C19";
    background_1 = "#232A25";
    border_color = "#78877D";
    red = "#B16139";
    green = "#489963";
    yellow = "#A07E3B";
    blue = "#478C90";
    magenta = "#55859B";
    cyan = "#1C9AA0";
    orange = "#9F713C";
    orange_bright = "#1C9AA0";
    opacity = "1";
    indicator_height = "2px";
    };
in
{
  programs.waybar.style = with custom; ''
      * {
        border: none;
        border-radius: 0px;
        padding: 0;
        margin: 0;
        font-family: ${font};
        font-weight: ${font_weight};
        opacity: ${opacity};
        font-size: ${font_size};
      }
      window#waybar {
        background: ${background_1};
        border-top: 0px solid ${border_color};
      }
      tooltip {
        background: ${background_1};
        border: 1px solid ${border_color};
      }
      tooltip label {
        margin: 5px;
        color: ${text_color};
      }
      #workspaces {
        padding-left: 15px;
      }
      #workspaces button {
        color: ${yellow};
        padding-left:  5px;
        padding-right: 5px;
        margin-right: 10px;
      }
      #workspaces button.empty {
        color: ${text_color};
      }
      #workspaces button.active {
        color: ${orange_bright};
      }
      #clock {
        color: ${text_color};
      }
      #tray {
        margin-left: 10px;
        color: ${text_color};
      }
      #tray menu {
        background: ${background_1};
        border: 1px solid ${border_color};
        padding: 8px;
      }
      #tray menuitem {
        padding: 1px;
      }
      #pulseaudio, #network, #cpu, #memory, #disk, #battery, #language, #custom-notification, #custom-power-menu {
        padding-left: 5px;
        padding-right: 5px;
        margin-right: 10px;
        color: ${text_color};
      }
      #pulseaudio, #language, #custom-notification {
        margin-left: 15px;
      }
      #custom-launcher {
        font-size: 20px;
        color: ${text_color};
        font-weight: bold;
        margin-left: 15px;
        padding-right: 10px;
      }
  '';
}