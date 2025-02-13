import 'package:flutter/material.dart';
import 'package:app_digital_account/Application/Constants/colors.dart';
import 'package:app_digital_account/Application/Widgets/Onboarding/app_bar.dart';
import 'package:app_digital_account/Application/Widgets/Onboarding/layout_onboarding.dart';
import 'package:app_digital_account/Application/Widgets/Text/text_normal.dart';
import 'package:app_digital_account/Application/Widgets/Text/text_title.dart';
import 'package:app_digital_account/Application/Widgets/Ui/material_box.dart';
import 'package:app_digital_account/Application/Widgets/Ui/switch_custom.dart';

class CardSelect extends StatefulWidget {
  const CardSelect({super.key});

  @override
  State<CardSelect> createState() => _CardSelectState();
}

class _CardSelectState extends State<CardSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarOnBoarding(
        title: "Cartões",
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      body: LayoutOnBoarding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(
                    './assets/images/credit_layout.png',
                    filterQuality: FilterQuality.high,
                  ),
                  const Positioned(
                    top: 20,
                    left: 30,
                    child: TextNormal(text: "PAGARE IP"),
                  ),
                  const Positioned(
                    top: 60,
                    left: 30,
                    child: Row(
                      children: [
                        Icon(
                          Icons.copy,
                          size: 20,
                          color: ColorsFigma.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        TextNormal(
                          text: "FILIPPI PERES",
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 90,
                    left: 30,
                    child: Row(
                      children: [
                        Icon(
                          Icons.copy,
                          size: 20,
                          color: ColorsFigma.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        TextNormal(
                          text: "**** **** **** 2024",
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 120,
                    left: 30,
                    child: Row(
                      children: [
                        Icon(
                          Icons.copy,
                          size: 20,
                          color: ColorsFigma.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        TextNormal(
                          text: "06/24",
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 150,
                    left: 30,
                    child: Row(
                      children: [
                        Icon(
                          Icons.copy,
                          size: 20,
                          color: ColorsFigma.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        TextNormal(
                          text: "000",
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    right: 40,
                    top: 20,
                    child: Icon(
                      Icons.remove_red_eye,
                      color: ColorsFigma.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
              FractionallySizedBox(
                widthFactor: 0.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    3,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    decoration: BoxDecoration(
                      color: ColorsFigma.grayDark,
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.lock,
                          color: ColorsFigma.white,
                        ),
                        TextNormal(
                          text: "Bloquear",
                        ),
                        SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                ),
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SwitchCustom(
                            checked: false,
                            onToggle: (p0) {},
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 16.0,
                            ),
                            child: TextTitle(
                              text: "Lojas físicas",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SwitchCustom(
                            checked: true,
                            onToggle: (p0) {},
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 16.0,
                            ),
                            child: TextTitle(
                              text: "Aproximação",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(
                      4,
                      (index) {
                        return const MaterialBox(
                          elevantion: 0,
                          padding: 15,
                          paddingVertical: 20,
                          color: ColorsFigma.gray,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.transform_outlined,
                                color: ColorsFigma.white,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: TextNormal(
                                  textAlign: TextAlign.center,
                                  text: "Editar\nVencimento",
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
