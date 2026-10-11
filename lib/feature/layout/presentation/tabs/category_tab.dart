import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/routes/pages_route.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../generated/l10n.dart';

import '../manager/category_cubit/category_tab_state.dart';
import '../manager/category_cubit/category_tab_view_model.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.bacground),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8),
              Text(tr.categories, style: AppTextStyles.inter700_20),
              SizedBox(height: 4),
              Divider(color: AppColors.primaryColor, thickness: 1.2),
              BlocBuilder<CategoryTabViewModel, CategoryTabState>(
                builder: (context, state) {
                  if (state is CategoryTabLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }

                  if (state is CategoryTabError) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            state.message,
                            style: AppTextStyles.inter500_14,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<CategoryTabViewModel>()
                                  .getAllCategories();
                            },
                            child: Text(tr.retry),
                          ),
                        ],
                      ),
                    );
                  }

                  if (state is CategoryTabSuccess &&
                      state.categories.isNotEmpty) {
                    return Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.only(top: 8),
                        itemCount: state.categories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.85,
                            ),
                        itemBuilder: (context, index) {
                          final category = state.categories[index];

                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                PagesRoute.productScreen,
                                arguments: category.id,
                              );
                            },
                            child: _CategoryCard(
                              imageUrl: category.image ?? '',
                              name: category.name ?? '',
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Center(
                    child: Text(
                      tr.noCategoriesFound,
                      style: AppTextStyles.inter600_18,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String name;

  const _CategoryCard({required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: AppColors.whiteColor,
      shadowColor: AppColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
                placeholder: (_, __) => Container(
                  color: AppColors.greyColor.withOpacity(.1),
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (_, __, ___) => Container(
                  color: AppColors.greyColor.withOpacity(.1),
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.inter500_14.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
