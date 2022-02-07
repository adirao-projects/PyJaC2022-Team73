int hexColor(String color) {
  color = color.replaceAll('#', '');
  switch (color.length) {
    case 3:
      color = '0xff' + color[0] * 2 + color[1] * 2 + color[2] * 2;
      break;

    case 6:
      color = '0xff' + color;
      break;
  }
  return int.parse(color);
}

int theme_dark = hexColor('#2D5794');
int theme2_dark = hexColor('#E1C255');
int bgPrimary_dark = hexColor('#1F1F1F');
int bgSecondary_dark = hexColor('#1A1A1A');
int textPrimary_dark = hexColor('#FFFFFF');
int textSecondary_dark = hexColor('#F3F3F3');

int theme_light = hexColor('#268AD3');
int theme2_light = hexColor('#E1C255');
int bgPrimary_light = hexColor('#FDF6E3');
int bgSecondary_light = hexColor('#EFE8D5');
int textPrimary_light = hexColor('#576E74');
int textSecondary_light = hexColor('#647B83');

List<int> theme = [theme_dark, theme_light];
List<int> theme2 = [theme2_dark, theme2_light];
List<int> bgPrimary = [bgPrimary_dark, bgPrimary_light];
List<int> bgSecondary = [bgSecondary_dark, bgSecondary_light];
List<int> textPrimary = [textPrimary_dark, textPrimary_light];
List<int> textSecondary = [textSecondary_dark, textSecondary_light];

int theme_index = 0;
