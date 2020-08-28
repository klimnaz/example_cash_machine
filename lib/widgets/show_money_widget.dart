import 'package:example_cash_machine/configs/size_config.dart';
import 'package:flutter/material.dart';
import '../models/nominal.dart';
import '../configs/styles.dart';

class ShowMoney extends StatelessWidget {
  final List<Nominal> firstColumnData;
  final List<Nominal> secondColumnData;

  const ShowMoney({Key key, this.firstColumnData, this.secondColumnData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(firstColumnData.length, (index) {
            return Text(
              "${firstColumnData[index].quantity} x ${firstColumnData[index].nominal} руб.",
              style: TextStyle(
                color: Color.fromRGBO(56, 39, 180, 1),
                fontSize: getProportionateScreenHeight(12),
              ),
            );
          }),
        ),
        secondColumnData.length != 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(secondColumnData.length, (index) {
                  return Text(
                    "${secondColumnData[index].quantity} x ${secondColumnData[index].nominal} руб.",
                    style: TextStyle(
                      color: Color.fromRGBO(56, 39, 180, 1),
                      fontSize: getProportionateScreenHeight(12),
                    ),
                  );
                }),
              )
            : SizedBox(),
      ],
    );
  }
}
