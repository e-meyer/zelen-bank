import 'package:flutter/material.dart';
import 'package:zelenbank/layers/presentation/ui/extract_screen/extract_screen.dart';

import 'core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zelen Bank',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.customtheme[Tema.lightTema],
      home: const ExtractScreen(),
    );
  }
}

// * get_current_balance -> retorna Future<double>
/*
    domain/
        usecases/ 
            usecase_name/
                get_current_balance_usecase.dart
                get_current_balance_usecase_impl.dart
        repositories/
            get_current_balance_repository.dart
    data/
        datasources/
            get_current_balance_datasource.dart
            external/
                get_current_balance_datasource_impl.dart
        repositories/
            get_current_balance_repository_impl.dart
*/
// * get_transaction_list -> retorna Future<List<TransactionEntity>> e
// * envia o numero da pagina atual por parametro (int) para manter controle
/*
    domain/
        usecases/ 
            usecase_name/
                get_transaction_list_usecase.dart
                get_transaction_list_usecase_impl.dart
        repositories/
            get_transaction_list_repository.dart
    data/
        datasources/
            get_transaction_list_datasource.dart
            external/
                get_transaction_list_datasource_impl.dart
        repositories/
            get_transaction_list_repository_impl.dart
*/
// * get_transaction_by_id -> retorna Future<TransactionEntity> e 
// * envia o ID de alguma transacao por parametro (String)
/*
    domain/
        usecases/ 
            usecase_name/
                get_transaction_by_id_usecase.dart
                get_transaction_by_id_usecase_impl.dart
        repositories/
            get_transaction_by_id_repository.dart
    data/
        datasources/
            get_transaction_by_id_datasource.dart
            external/
                get_transaction_by_id_datasource_impl.dart
        repositories/
            get_transaction_by_id_repository_impl.dart
*/