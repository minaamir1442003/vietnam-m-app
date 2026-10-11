import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_one/core/di/injectable_initializer.dart';
import 'package:project_one/core/utils/text_styles.dart';
import 'package:project_one/core/widget/custom_dialog.dart';
import 'package:project_one/feature/product/manager/products_state.dart';
import 'package:project_one/feature/product/manager/products_view_model.dart';
import 'package:project_one/feature/product/view/widget/custom_product_card.dart';
import 'package:project_one/feature/product/view/widget/custom_shimmer_card.dart';

import '../../../core/routes/pages_route.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../generated/l10n.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context)!.settings.arguments as int;
    var tr = S.of(context);
    var vm = getIt.get<ProductsViewModel>();
    return BlocProvider(
      create: (context) => vm..getProductsByCategory(id),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.bacground),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocConsumer<ProductsViewModel, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return ShimmerProductsGrid(
                  length: vm.products.isEmpty ? 6 : vm.products.length,
                );
              }
              if (state is ProductsSuccess && state.products.isNotEmpty) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Text(tr.products, style: AppTextStyles.outfit700_20),
                        SizedBox(height: 6),
                        Divider(color: AppColors.primaryColor, thickness: 1.2),
                        SizedBox(height: 16),

                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: .7,
                                ),
                            itemCount: state.products.length,
                            itemBuilder: (context, index) {
                              final product = state.products[index];
                              return CustomProductCard(
                                heroTag: product.id,
                                imageUrl: product.image ?? "",
                                title: product.name,
                                description: product.description,
                                price: product.price.toString(),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    PagesRoute.productDetailsScreen,
                                    arguments: product,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Center(
                child: Text(
                  tr.noProductsFound,
                  style: AppTextStyles.outfit700_20,
                ),
              );
            },
            listener: (context, state) {
              if (state is ProductsError) {
                DialogUtils.showMessage(
                  context: context,
                  message: state.message,
                  title: tr.error,
                  postActionName: tr.retry,
                  negativeActionName: tr.cancel,
                  negativeAction: () {
                    Navigator.pop(context);
                  },
                  postAction: () {
                    vm.getProductsByCategory(id);
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
