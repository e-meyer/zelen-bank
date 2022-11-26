import 'package:flutter/material.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/presentation/ui/common/back_button.dart';
import 'package:zelenbank/layers/presentation/controllers/transaction_controller.dart';
import 'package:zelenbank/layers/presentation/ui/common/back_button.dart';
import '../../../../../core/injector/injector.dart';
import '../components/BankName.dart';
import '../components/TransactionType.dart';
import '../../../../../core/utils/constants/transaction_type_constants.dart'
    as constants;

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
              TransactionEntity data = snapshot.data!;
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
                          Text(constants.Constants[data.transactionType]),
                          Text('Valor'),
                          Text('R\$${data.amount.toString()}'),
                          TransactionType(
                            transactionController: _transactionController,
                            data: data,
                          ),
                          Text(data.targetName),
                          BankName(data.bankName),
                          Text('Data/Hora'),
                          Text(data.createdAt.toString()),
                          Text('Autenticação'),
                          data.authentication != null
                              ? Text(data.authentication!)
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
