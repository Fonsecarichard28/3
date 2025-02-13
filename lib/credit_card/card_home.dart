import 'package:flutter/material.dart';
import 'package:app_digital_account/Application/Widgets/Text/text_normal.dart';
import 'package:app_digital_account/Domain/bloc/Card/card_state.dart';
import 'package:go_router/go_router.dart';

class CardHome extends StatefulWidget {
  final CardState? cardState;
  const CardHome({super.key, this.cardState});

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .push("/wallet"),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment
            .center,
        mainAxisAlignment:
        MainAxisAlignment
            .end,
        children: [
          Image.asset(
            './assets/images/card_image.png',
            width: 100,
            filterQuality:
            FilterQuality
                .high,
          ),
          if (widget.cardState!
              .cards
              .isNotEmpty) ...[
            TextNormal(
              text:
              "FINAL ${widget.cardState?.cards[0].maskedNumber?.substring(11, 15)}",
              fontSize: 10,
            )
          ],
        ],
      ),
    );
  }
}