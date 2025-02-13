import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:app_digital_account/Application/Constants/colors.dart';

import 'package:app_digital_account/Application/Widgets/Text/text_normal.dart';
import 'package:app_digital_account/Application/Widgets/Text/text_title.dart';
import 'package:app_digital_account/Application/Widgets/Ui/button_router.dart';
import 'package:app_digital_account/Domain/bloc/Card/card_state.dart';
import 'package:app_digital_account/Application/Providers/providers.dart';

import 'package:app_digital_account/Extensions/Formatters/iformatter_util.dart';
import 'package:app_digital_account/Domain/bloc/Balance/balance_state.dart';
import 'package:app_digital_account/Domain/bloc/User/user_state.dart';
import 'package:app_digital_account/Application/Providers/providers.dart';
import 'package:app_digital_account/new/manager/onboarding_manager.dart';
import 'package:provider/provider.dart';

class CardLimitWidget extends StatefulWidget {
  final CardState? cardState;
  final BalanceState? balanceState;

  const CardLimitWidget({super.key, this.cardState, this.balanceState});

  @override
  State<CardLimitWidget> createState() => _CardLimitWidgetState();
}

class _CardLimitWidgetState extends State<CardLimitWidget> {
  double getTotalCardLimit(CardState cardState) {
    if (cardState.creditInvoice == null) return 0.0;
    return cardState.creditInvoice?.resumed.limits.totalcreditlimit
            .toDouble() ??
        0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                ),
                width: 10,
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  await context.read<OnboardingManager>().postCreditAnalysis(
                        guid: 'fc7b33b1-90a5-4740-a68a-6e363e04eb9e',
                      );
                  await context.read<OnboardingManager>().convert(
                        guid: 'fc7b33b1-90a5-4740-a68a-6e363e04eb9e',
                        deviceName: 'S20FE',
                        deviceId: '651561681681861',
                      );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: TextTitle(
                    text: "Em aberto",
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextTitle(
            text: getIt<IFormatterUtil>().formatCurrency(
              getTotalCardLimit(
                widget.cardState!,
              ),
            ),
            color: Theme.of(context).colorScheme.primary,
            fontSize: 28,
          ),
        ),
        Container(
          width: double.infinity,
          height: 10,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(1),
          color: ColorsFigma.white,
          child: Container(
            width: 130,
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: TextNormal(
            text:
                "Limite disponível: R\$ ${widget.balanceState?.balanceModel?.limit?.toStringAsFixed(2).replaceAll('.', ',') ?? '0,00'}",
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        TextNormal(
          text: "Melhor dia de compra 2",
          color: Theme.of(context).colorScheme.primary,
          fontSize: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ButtonRouter(
            title: "Acessar fatura",
            function: () {},
          ),
        ),
      ],
    );
  }
}