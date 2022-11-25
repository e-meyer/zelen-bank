import 'package:flutter/material.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/presentation/ui/common/back_button.dart';
import 'package:zelenbank/layers/presentation/controllers/transaction_controller.dart';
import '../../../../../core/injector/injector.dart';

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
              return Column(children: [
                Text('Comprovante'),
                Divider(),
                Column(children: [
                  Text('Tipo de Movimentação'),
                  Text(snapshot.data!.transactionType),
                  Text('Valor'),
                  Text(snapshot.data!.amount.toString()),
                  Text(_transactionController.isReceived(snapshot.data!)
                      ? 'Recebedor'
                      : 'Pagador'),
                  Text(snapshot.data!.targetName),
                  snapshot.data!.bankName != null
                      ? Text('Instituição bancária')
                      : Container(),
                  snapshot.data!.bankName != null
                      ? Text(snapshot.data!.bankName!)
                      : Container(),
                  Text('Data/Hora'),
                  Text(snapshot.data!.createdAt.toString()),
                  Text('Autenticação'),
                  snapshot.data!.authentication != null
                      ? Text(snapshot.data!.authentication!)
                      : Container()
                ]),
                ElevatedButton(onPressed: () {}, child: Text('Compartilhar'))
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
