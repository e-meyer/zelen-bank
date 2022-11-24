import 'package:flutter/material.dart';
import 'package:zelenbank/layers/presentation/ui/common/back_button.dart';
import 'package:zelenbank/layers/presentation/controller/transaction_details_controller.dart';

class TransactionDetails extends StatelessWidget {
  final String id;
  const TransactionDetails(this.id, {Key? key}) : super(key: key);

  // TODO: CORRIGIR ESPAÇAMENTOS APÓS CONCLUIR PARTE DE DADOS
  @override
  Widget build(BuildContext context) {
    final TransactionController transactionController =
        serviceLocator.get<TransactionController>();
    final transaction = transactionController.getById(id);
    return Container(
      child: Column(children: [
        Text('Comprovante'),
        Divider(),
        Column(children: [
          Text('Tipo de Movimentação'),
          Text(transaction.transactionType),
          Text('Valor'),
          Text(transaction.value.toString()),
          Text(transactionController.isReceived(await transaction) ? 'Recebedor' : 'Pagador'),
          Text(transaction.to ? transaction : transaction.from),
          Text('Instituição bancária'),
          Text(transaction.bankName),
          Text('Data/Hora'),
          Text(transaction.dateTime),
          Text('Autenticação'),
          Text(transaction.auth),
        ]),
        ElevatedButton(onPressed: () {}, child: Text('Compartilhar'))
      ]),
    );
  }
}
