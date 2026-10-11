import 'package:flutter/material.dart';
import 'package:project_one/core/routes/pages_route.dart';
import 'package:project_one/core/utils/app_assets.dart';
import 'package:project_one/core/utils/app_colors.dart';
import 'package:project_one/core/utils/text_styles.dart';

import '../../../../generated/l10n.dart';

class CustomHeaderLayout extends StatelessWidget {
  final String name;
  final String role;
  final String points;
  final String? image;
  final void Function()? onTap;
  final bool isShown;
  final Widget avatarWidget;

  const CustomHeaderLayout({
    super.key,
    required this.name,
    this.image,
    required this.role,
    required this.points,
    required this.onTap,
    required this.avatarWidget,
    this.isShown = false,
  });

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .35,
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
      decoration: const BoxDecoration(
        color: Color(0xff0A5DBA),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(36)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(onTap: onTap, child: avatarWidget),
              const SizedBox(width: 12),
              isShown
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${tr.welcome} $name!",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          role,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
              const Spacer(),
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(IconAssets.loginIcon),
              ),
            ],
          ),

          const SizedBox(height: 24),
          Text(
            tr.myPoints,
            style: AppTextStyles.outfit700_20.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 20),
              const SizedBox(width: 6),
              Text(
                "$points",
                style: AppTextStyles.outfit700_20.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
