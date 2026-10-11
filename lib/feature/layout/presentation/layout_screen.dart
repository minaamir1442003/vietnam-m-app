import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_one/core/di/injectable_initializer.dart';
import 'package:project_one/core/routes/pages_route.dart';
import 'package:project_one/feature/layout/presentation/manager/category_cubit/category_tab_view_model.dart';
import 'package:project_one/feature/layout/presentation/manager/home_cubit/home_tab_view_model.dart';
import 'package:project_one/feature/layout/presentation/manager/prize_cubit/prize_tab_view_model.dart';
import 'package:project_one/feature/layout/presentation/tabs/category_tab.dart';
import 'package:project_one/feature/layout/presentation/tabs/find_users_tab.dart';
import 'package:project_one/feature/layout/presentation/tabs/home_tab.dart';
import 'package:project_one/feature/layout/presentation/tabs/wallet_tab.dart';
import 'package:project_one/feature/layout/presentation/widgets/custom_bottom_navigation_bar_item.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../generated/l10n.dart';
import '../../user_profile/manager/user_profile_view_model.dart';
import 'manager/wallet_cubit/wallet_tab_view_model.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  bool _calledProfile = false;

  late final List<Widget> tabs;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_calledProfile) {
        context.read<ProfileViewModel>().getUserProfile();
        _calledProfile = true;
      }
    });
    tabs = [
      HomeTab(),
      CategoryTab(),
      WalletTab(),
      FindUsersTab(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    final role = context.watch<ProfileViewModel>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<HomeCubit>()..loadHome()),
        BlocProvider(
          create: (_) => getIt.get<CategoryTabViewModel>()..getAllCategories(),
        ),
        BlocProvider(
          create: (context) => getIt.get<PrizesViewModel>()..loadPrizes(),
        ),
        BlocProvider(create: (_) => getIt<WalletCubit>()..loadWallet()),
      ],
      child: WillPopScope(
        onWillPop:()async {
          SystemNavigator.pop();
          return false;
        } ,
        child: Scaffold(
          body: IndexedStack(index: currentIndex, children: tabs),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            elevation: 6,
            onPressed: () {
              Navigator.pushNamed(context, PagesRoute.redeemCode);
            },
            child: const Icon(
              Icons.qr_code_scanner,
              color: Colors.white,
              size: 28,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 12,
            color: AppColors.primaryColor,
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBottomNavigationBarItem(
                    icon: Icons.home,
                    label: tr.home,
                    isActive: currentIndex == 0,
                    onTap: () => setState(() => currentIndex = 0),
                  ),
                  // const SizedBox(width: 16,),
                  CustomBottomNavigationBarItem(
                    icon: Icons.category_outlined,
                    label: tr.categories,
                    isActive: currentIndex == 1,
                    onTap: () => setState(() => currentIndex = 1),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .15),
                  CustomBottomNavigationBarItem(
                    icon: Icons.account_balance_wallet_sharp,
                    label: tr.wallet,
                    isActive: currentIndex == 2,
                    onTap: () => setState(() => currentIndex = 2),
                  ),
                  CustomBottomNavigationBarItemByOrder(
                    icon: Icons.person_add_alt_rounded,
                    label: role.userModel?.minRole == "0"
                        ? tr.worker
                        : role.userModel?.minRole == "1"
                        ? tr.merchant
                        : role.userModel?.minRole == "2"
                        ? tr.distributor
                        : tr.user,
                    isActive: currentIndex == 3,
                    onTap: () => setState(() => currentIndex = 3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void updateIndex() {
    currentIndex = 1;
    setState(() {});
  }
}
