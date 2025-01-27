import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_second_diary/utils/constants.dart';
import 'package:one_second_diary/utils/theme.dart';

class SwitchThemeComponent extends StatelessWidget {
  final String title = 'darkMode'.tr;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                ),
              ),
              ValueBuilder<bool>(
                initialValue: ThemeService().isDarkTheme(),
                builder: (isChecked, updateFn) => Switch(
                  value: isChecked,
                  onChanged: (value) {
                    updateFn(!ThemeService().isDarkTheme());
                    ThemeService().switchTheme();
                  },
                  activeTrackColor: AppColors.mainColor.withOpacity(0.4),
                  activeColor: AppColors.mainColor,
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
