import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/presentation/ui/common/back_button.dart';
import 'package:zelenbank/layers/presentation/controllers/transaction_controller.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/app_bar_method.dart';
import '../../../../../core/injector/injector.dart';
import '../../statement_screen/components/text_modificad.dart';
import '../components/authentication.dart';
import '../components/bank_name.dart';
import '../components/custom_elevated_butom.dart';
import '../components/transaction_type.dart';
import '../../../../../core/utils/constants/transaction_type_constants.dart'
    show transactionTypeMap;

// ignore: must_be_immutable
class TransactionDetails extends StatelessWidget {
  final TransactionController _transactionController =
      serviceLocator.get<TransactionController>();
  final String id;
  GlobalKey previewContainer = GlobalKey();
  TransactionDetails(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      Padding(
                        padding: const EdgeInsets.only(left: 9, top: 5),
                        child: textModificad(
                            texto: 'Comprovante',
                            bold: FontWeight.bold,
                            size: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(
                                thickness: 2.2,
                                height: 25,
                              ),
                              textModificad(
                                  texto: 'Tipo de Movimentação',
                                  bold: FontWeight.bold,
                                  height: 2),
                              textModificad(
                                  texto:
                                      transactionTypeMap[data.transactionType]!,
                                  height: 1.7),
                              textModificad(
                                  texto: 'Valor',
                                  bold: FontWeight.bold,
                                  height: 3.5),
                              textModificad(
                                  texto: 'R\$${data.amount.toString()}',
                                  height: 1.7),
                              const SizedBox(
                                height: 20,
                              ),
                              TransactionType(
                                transactionController: _transactionController,
                                data: data,
                              ),
                              textModificad(texto: data.targetName, height: 2),
                              BankName(data.bankName),
                              textModificad(
                                  texto: 'Data/Hora',
                                  bold: FontWeight.bold,
                                  height: 3.5),
                              textModificad(
                                  texto: DateFormat('d MMM yyyy - HH:mm:ss')
                                      .format(data.createdAt),
                                  height: 1.7),
                              const SizedBox(
                                height: 20,
                              ),
                              const Authentication(),
                              data.authentication != null
                                  ? Text(data.authentication!)
                                  : Container(),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 80, bottom: 20),
                                child: customElevatedButtom(
                                    context, previewContainer),
                              ),
                            ]),
                      )
                    ],
                  ));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
