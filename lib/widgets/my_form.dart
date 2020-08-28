import 'package:example_cash_machine/configs/size_config.dart';
import 'package:example_cash_machine/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cash_machine/cash_machine_bloc.dart';

class MyForm extends StatefulWidget {
  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Введите сумму",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenHeight(10)),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _textController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "0",
                      suffixText: "руб.",
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null) {
                        return "Пустое поле";
                      }
                      if (int.tryParse(value) == null) {
                        return "Введите целое число";
                      }

                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight / 8,
              ),
              RaisedButton(
                color: mainButtonColor,
                padding: EdgeInsets.fromLTRB(35, 20, 35, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    final value = int.parse(_textController.text);
                    BlocProvider.of<CashMachineBloc>(context)
                        .add(GetMoney(value));
                    _textController.text = '';
                  }
                },
                child: Text(
                  'Выдать сумму',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenHeight(10)),
                ),
              )
            ]));
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
