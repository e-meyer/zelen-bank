import 'package:flutter/material.dart';
import 'package:zelenbank/core/share_image/share_image.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/presentation/ui/common/back_button.dart';
import 'package:zelenbank/layers/presentation/controllers/transaction_controller.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/app_bar_method.dart';
import '../../../../../core/injector/injector.dart';
import '../components/authentication.dart';
import '../components/bank_name.dart';
import '../components/transaction_type.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../../../../../core/utils/constants/transaction_type_constants.dart'
    show transactionTypeMap;
import 'package:zelenbank/core/utils/constants/colors_constants.dart'
    as color_constants;

// ignore: must_be_immutable
class TransactionDetails extends StatelessWidget {
  final TransactionController _transactionController =
      serviceLocator.get<TransactionController>();
  final String id;
  GlobalKey previewContainer = GlobalKey();
  TransactionDetails(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: appBarMethod(titulo: '', leading: const CustomBackButton()),
      body: FutureBuilder<TransactionEntity>(
          future: _transactionController.getById(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              TransactionEntity data = snapshot.data!;
              return RepaintBoundary(
                  key: previewContainer,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 9, top: 5),
                          child: Text(
                            'Comprovante',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 13, right: 13),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Comprovante'),
                                  Text('Tipo de Movimentação'),
                                  Text(transactionTypeMap[
                                      data.transactionType]!),
                                  Text('Valor'),
                                  Text('R\$${data.amount.toString()}'),
                                  TransactionType(
                                    transactionController:
                                        _transactionController,
                                    data: data,
                                  ),
                                  Text(
                                    data.targetName,
                                    style: const TextStyle(
                                      height: 2,
                                    ),
                                  ),
                                  BankName(data.bankName),
                                  Text('Data/Hora'),
                                  Text(DateFormat('d MMM yyyy - HH:mm:ss')
                                      .format(data.createdAt)),
                                  Authentication(snapshot.data!),
                                  data.authentication != null
                                      ? Text(data.authentication!)
                                      : Container()
                                ])),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ElevatedButton(
                                onPressed: () => shareImage(previewContainer),
                                child: Text('Compartilhar')))
                      ]));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
