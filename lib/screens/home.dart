import 'package:example_cash_machine/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/my_form.dart';
import '../widgets/bank_store_widget.dart';
import '../widgets/output_widget.dart';
import '../configs/styles.dart';
import '../widgets/wave_widget.dart';
import '../bloc/cash_machine/cash_machine_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Image(
          image: AssetImage("lib/assets/icons/main_icon.png"),
          height: 30,
          fit: BoxFit.fitHeight,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              BlocProvider.of<CashMachineBloc>(context).add(Refresh());
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return OrientationBuilder(builder: (context, orientation) {
      return Stack(
        children: <Widget>[
          Container(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomWave(
                    rotated: true,
                    height: orientation == Orientation.portrait
                        ? SizeConfig.screenHeight / 4
                        : SizeConfig.screenHeight / 3 - 20,
                  ),
                  orientation == Orientation.portrait
                      ? CustomWave(
                          rotated: false,
                          height: SizeConfig.screenHeight / 8 + 20,
                        )
                      : SizedBox(),
                ],
              )),
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        SizeConfig.screenWidth / 8,
                        orientation == Orientation.portrait ? 40 : 5,
                        SizeConfig.screenWidth / 8,
                        20),
                    child: MyForm(),
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          color: lightGreyLine,
                          width: double.infinity,
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Банкомат выдал следующие купюры",
                                  style: TextStyle(
                                    color: Color.fromRGBO(163, 162, 172, 1),
                                    fontSize: getProportionateScreenHeight(9),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              OutputWidget(),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          color: lightGreyLine,
                          width: double.infinity,
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Баланс банкомата",
                                    style: TextStyle(
                                      color: Color.fromRGBO(163, 162, 172, 1),
                                      fontSize: getProportionateScreenHeight(9),
                                    )),
                              ),
                              BankStoreWidget(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
