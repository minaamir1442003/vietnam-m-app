import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_one/core/utils/app_assets.dart';
import 'package:project_one/feature/layout/presentation/widgets/custom_tarnsaction_item.dart';
import 'package:project_one/feature/layout/presentation/widgets/wallet_header.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../generated/l10n.dart';
import '../manager/wallet_cubit/wallet_tab_state.dart';
import '../manager/wallet_cubit/wallet_tab_view_model.dart';

class WalletTab extends StatefulWidget {
  const WalletTab({super.key});

  @override
  State<WalletTab> createState() => _WalletTabState();
}

class _WalletTabState extends State<WalletTab> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<WalletCubit>().loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        if (state.isLoading && state.transactions.isEmpty) {
          return const Center(child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ));
        }

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(ImageAssets.bacground),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: MediaQuery.of(context).padding.top),
              ),
              SliverToBoxAdapter(child: WalletHeader(balance: state.balance)),

              if (state.transactions.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: _EmptyWalletState(),
                )
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final tx = state.transactions[index];
                    return CustomTransactionItem(tx: tx);
                  }, childCount: state.transactions.length),
                ),

              if (state.isLoadingMore)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _EmptyWalletState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tr=S.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.account_balance_wallet_outlined,
          size: 80,
          color: Colors.grey,
        ),
        const SizedBox(height: 16),
        Text(tr.noTransactionsYet, style: AppTextStyles.inter500_18),
        const SizedBox(height: 8),
        Text(
          tr.startEarningPointsToSeeThemHere,
          style: AppTextStyles.inter400_14.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
