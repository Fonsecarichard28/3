import 'package:flutter/material.dart';
import 'package:app_digital_account/Application/Constants/colors.dart';
import 'package:app_digital_account/Application/Widgets/Onboarding/app_bar.dart';
import 'package:app_digital_account/Application/Widgets/Text/text_title.dart';

class CardLimit extends StatefulWidget {
  const CardLimit({super.key});

  @override
  State<CardLimit> createState() => _CardLimitState();
}

class _CardLimitState extends State<CardLimit> {
  late double valor = 0;
  final TextEditingController _controller = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBarOnBoarding(
        title: "Limite",
        color: Theme.of(context).colorScheme.onPrimaryContainer,

      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: ColorsFigma.primary,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration:  BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ),
                child: TextFormField(
                  onChanged: (value) {
                    _controller.text += "0";
                  },
                  style:  TextStyle(color: Theme.of(context).colorScheme.secondaryContainer),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none),
                  textAlign: TextAlign.center,
                  controller: _controller,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: TextTitle(
                  text: "Valor disponível: R\$ 2000,00",
                  fontSize: 16,
                ),
              ),
              Slider(
                  thumbColor: ColorsFigma.white,
                  activeColor: Theme.of(context).colorScheme.secondaryContainer,
                  value: valor,
                  min: 0,
                  max: 2000,
                  onChanged: (value) {
                    setState(() {
                      valor = value;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
