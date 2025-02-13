import 'package:flutter/material.dart';
import 'package:app_digital_account/Domain/Models/transaction_response.dart';
import 'package:app_digital_account/Application/Constants/colors.dart';
import 'package:app_digital_account/Application/Widgets/Statement/transfer_item.dart';
import 'package:app_digital_account/Application/Widgets/Text/text_normal.dart';
import 'package:app_digital_account/Application/Widgets/Text/text_title.dart';
import 'package:app_digital_account/Application/Widgets/Ui/button_outline.dart';
import 'package:app_digital_account/Application/Widgets/Ui/button_router.dart';
import 'package:app_digital_account/Application/Widgets/Ui/material_box.dart';

class CardDescription extends StatefulWidget {
  final int type;

  const CardDescription({super.key, required this.type});

  @override
  State<CardDescription> createState() => _CardDescriptionState();
}

class _CardDescriptionState extends State<CardDescription> {
  @override
  Widget build(BuildContext context) {
    if (widget.type == 1) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0),
        child: TextTitle(text: "Bloqueado"),
      );
    }

    if (widget.type == 0) {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: TextTitle(
              text: "Em aberto",
            ),
          ),
          const TextTitle(
            text: "R\$ 560,00",
            fontSize: 32,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: TextTitle(
              text: "Limite disponível R\$ 1.000,00",
            ),
          ),
          const TextNormal(
            text: "Melhor dia de compra: dia 2",
            fontSize: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ButtonRouter(
              title: "Acessar fatura2",
              function: () {
                print('1232132');
              },
            ),
          ),
          ButtonOutlineCustom(
            title: "Cartão Virtual",
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ),
          ...List.generate(
            10,
            (index) {
              return TransferItem(
                transactionResponse: TransactionResponse(
                  date: "2024-01-23 16:48:19",
                  description: "",
                  fromAccount: ToAccount(
                    account: "59182386",
                    accountType: "TRAN",
                    agency: "0001",
                    bank: "633",
                    bankName: "Banco Rendimento S.A",
                    document: "22737773881",
                    name: "Daniel Rodrigues Saes",
                  ),
                  id: "BB3CA9CDE6C64690AC406BE46871EC73",
                  invoiceResume: null,
                  pixTransaction: false,
                  status: null,
                  toAccount: ToAccount(
                    account: "59182386",
                    accountType: "TRAN",
                    agency: "0001",
                    bank: "633",
                    bankName: "Banco Rendimento S.A",
                    document: "22737773881",
                    name: "Daniel Rodrigues Saes",
                  ),
                  type: "Pix",
                  value: 10.43,
                ),
              );
            },
          ).toList()
        ],
      );
    }
    if (widget.type == 2) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0),
        child: TextTitle(text: "Em trânsito"),
      );
    }

    return const SizedBox.shrink();
  }
}
