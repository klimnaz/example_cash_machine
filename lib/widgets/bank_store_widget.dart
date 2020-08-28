import 'package:example_cash_machine/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/bank_repository/bank_repository.dart';
import '../models/nominal.dart';
import 'show_money_widget.dart';

class BankStoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<List<Nominal>>>(
      stream: RepositoryProvider.of<BankRepository>(context).bankData,
      initialData: null,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            final firstColumnData = snapshot.data[0];
            final secondColumnData = snapshot.data[1];

            return Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: ShowMoney(
                firstColumnData: firstColumnData,
                secondColumnData: secondColumnData,
              ),
            );
          }
        }
        return new CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
        );
      },
    );
  }
}
