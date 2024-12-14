import 'package:flutter/material.dart';

import '../../../constant/app_text_styles.dart';

class BuildDrawerListTile extends StatelessWidget {
  const BuildDrawerListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final Icon leadingIcon;
  final Icon trailingIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: leadingIcon,
        title: Text(
          title,
          style: AppTextStyles.font16SemiBoldBlack,
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.font12RegularBlack,
        ),
        trailing: trailingIcon,
      ),
    );
  }
}
