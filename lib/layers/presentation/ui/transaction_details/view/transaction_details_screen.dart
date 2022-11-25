import 'package:flutter/material.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/presentation/ui/common/back_button.dart';
import 'package:zelenbank/layers/presentation/controllers/transaction_controller.dart';
import 'package:zelenbank/layers/presentation/ui/common/back_button.dart';
import '../../../../../core/injector/injector.dart';
import '../components/BankName.dart';
import '../components/TransactionType.dart';

class TransactionDetails extends StatelessWidget {
  final TransactionController _transactionController =
      serviceLocator.get<TransactionController>();
  final String id;
  TransactionDetails(this.id, {Key? key}) : super(key: key);
  // TODO: CORRIGIR ESPAÇAMENTOS APÓS CONCLUIR PARTE DE DADOS
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<TransactionEntity>(
          future: _transactionController.getById(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * .8),
                        child: CustomBackButton()),
                    Text('Comprovante'),
                    Divider(),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Tipo de Movimentação'),
                          Text(snapshot.data!.transactionType),
                          Text('Valor'),
                          Text(snapshot.data!.amount.toString()),
                          TransactionType(
                            transactionController: _transactionController,
                            data: snapshot.data!,
                          ),
                          Text(snapshot.data!.targetName),
                          BankName(snapshot.data!.bankName),
                          Text('Data/Hora'),
                          Text(snapshot.data!.createdAt.toString()),
                          Text('Autenticação'),
                          snapshot.data!.authentication != null
                              ? Text(snapshot.data!.authentication!)
                              : Container()
                        ]),
                    ElevatedButton(
                        onPressed: () {}, child: Text('Compartilhar'))
                  ]);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
