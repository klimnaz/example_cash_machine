import 'package:example_cash_machine/bloc/cash_machine/cash_machine_bloc.dart';
import 'package:example_cash_machine/repositories/bank_repository/bank_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home.dart';
import 'simple_bloc_observer.dart';

void main(){
  Bloc.observer = SimpleBlocObserver();

  runApp(App(bankRepository: BankRepository(),));
}

class App extends StatelessWidget {
  final BankRepository bankRepository;

  const App({Key key, this.bankRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);

    return RepositoryProvider.value(
      value: bankRepository,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => CashMachineBloc(bankRepository: bankRepository)..add(Refresh()),
          child: Home(),
        ),
      ),
    );
  }
}