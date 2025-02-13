import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_digital_account/Application/Constants/colors.dart';
import 'package:app_digital_account/Application/Widgets/Onboarding/app_bar.dart';
import 'package:app_digital_account/Application/Widgets/Text/text_normal.dart';
import 'package:app_digital_account/Domain/Interfaces/icard_bloc.dart';
import 'package:app_digital_account/Domain/bloc/Card/card_state.dart';

import 'package:app_digital_account/Application/Providers/providers.dart';
import 'package:app_digital_account_credit_card/Teste/card_description.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  late int type = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBarOnBoarding(
        title: "Cartões123",
        color: Theme.of(context).colorScheme.onPrimaryContainer,

      ),
      body: BlocBuilder<ICardBloc, CardState>(
          bloc: getIt<ICardBloc>(),
          builder: (context, state) {
            return Container(
              color: ColorsFigma.primary,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: CarouselSlider(
                                options: CarouselOptions(
                                  height: 350.0,
                                  enableInfiniteScroll: false,
                                  viewportFraction: 0.7,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      type = index;
                                    });
                                  },
                                ),
                                items: [
                                  ...state.cards.map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Opacity(
                                          opacity: 1,
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            child: Container(
                                              height: 320,
                                              width: 250,
                                              decoration:  BoxDecoration(
                                                color: ColorsFigma.grayDark,
                                                border: Border(
                                                  bottom: BorderSide(
                                                    width: 2,
                                                    color:
                                                    Theme.of(context).colorScheme.secondaryContainer,
                                                  ),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceAround,
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.only(
                                                      right: 16,
                                                    ),
                                                    alignment:
                                                    Alignment.centerRight,
                                                    width: double.infinity,
                                                    child: const Icon(
                                                      Icons.edit,
                                                      color: ColorsFigma.white,
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Image.asset(
                                                        './assets/images/card_credit.png'),
                                                  ),
                                                  TextNormal(
                                                    text:
                                                    "Final ${i.maskedNumber?.substring(11, 15)}",
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 350,
                                      width: 250,
                                      decoration:  BoxDecoration(
                                          color: ColorsFigma.grayDark,
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 2,
                                                  color:
                                                  Theme.of(context).colorScheme.secondaryContainer))),
                                      child:  Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Theme.of(context).colorScheme.secondaryContainer,
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: CardDescription(
                              type: 0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
