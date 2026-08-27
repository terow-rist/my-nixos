{ ... }:
let
  custom = {
    font = "Maple Mono";
    font_size = "18px";
    font_weight = "bold";
    text_color = "#cdcdcd";
    background_0 = "#212121";
    background_1 = "#303030";
    border_color = "#707070";
    red = "#f92672";
    green = "#a6e22e";
    yellow = "#e6db74";
    blue = "#66d9ef";
    magenta = "#9e6ffe";
    cyan = "#708387";
    orange = "#fd971f";
    orange_bright = "#f92672";
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