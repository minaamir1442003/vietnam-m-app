import 'package:flutter/material.dart';
import 'package:project_one/core/service/open_whatsapp_order.dart';
import 'package:project_one/core/utils/constant_manager.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/text_styles.dart';
import '../../../data/model/products_response_model.dart';
import '../../../generated/l10n.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProductDetailsBody(product: product),
    );
  }
}

class ProductDetailsBody extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'product_${product.id}',
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            expandedHeight: 380,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),

            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                final collapseRatio = constraints.maxHeight / 380;
                final isCollapsed = collapseRatio < 0.35;

                return FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  stretchModes: const [
                    StretchMode.zoomBackground,
                    StretchMode.fadeTitle,
                  ],

                  title: isCollapsed
                      ? Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.inter500_16.copyWith(
                            color: Colors.black,
                          ),
                        )
                      : null,

                  background: Image.network(
                    product.image ?? '',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              },
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.price} ${S.of(context).egp}',
                    style: AppTextStyles.inter700_20.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(product.name, style: AppTextStyles.inter600_18),

                  const SizedBox(height: 16),

                  Text(
                    product.description,
                    style: AppTextStyles.inter400_14.copyWith(height: 1.6),
                  ),

                  const SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () async {
                        final launched = await openWhatsAppOrder(
                          phone: AppConstants.orderWhatsAppNumber,
                          message: product.name,
                        );
                        if (!launched && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(S.of(context).couldNotOpenWhatsApp),
                            ),
                          );
                        }
                      },
                      child: Text(S.of(context).order),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
