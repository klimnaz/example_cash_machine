import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cash_machine/cash_machine_bloc.dart';
import '../configs/styles.dart';
import 'show_money_widget.dart';

class OutputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashMachineBloc, CashMachineState>(
      builder: (context, state) {
        if (state is CashMachineError) {
          return Container(
            margin: EdgeInsets.fromLTRB(40, 10, 0, 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "${state.error}",
              style: moneyText,
            ),
          );
        }
        if (state is CashMachineOutput) {
          if (state.outputMoney == null) {
            return Container(
              margin: EdgeInsets.fromLTRB(40, 10, 0, 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Нет данных",
                style: moneyText,
              ),
            );
          }
          final firstColumnData = state.outputMoney[0];
          final secondColumnData = state.outputMoney[1];
          return Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ShowMoney(
              firstColumnData: firstColumnData,
              secondColumnData: secondColumnData,
            ),
          );
        }

        return new CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
        );
      },
    );
  }
}
