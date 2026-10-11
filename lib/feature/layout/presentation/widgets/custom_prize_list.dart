import 'package:flutter/material.dart';
import 'package:project_one/data/model/home_tab_response_model.dart';
import 'package:project_one/generated/l10n.dart';

import 'custom_prize_card.dart';

class CustomPrizeList extends StatelessWidget {
  const CustomPrizeList({
    super.key,
    required this.prize,
    this.onRedeem, // جديد
  });

  final List<PrizeResponseModel> prize;
  final void Function(PrizeResponseModel prize)? onRedeem; // جديد

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .28,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: prize.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final p = prize[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .45,
                child: CustomPrizeCard(
                  prize: p,
                  showButton: true,
                  button: ElevatedButton(
                    onPressed: () => onRedeem?.call(p),
                    child: Text(S.of(context).redeem),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
