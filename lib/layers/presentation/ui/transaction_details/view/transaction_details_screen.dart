import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/presentation/ui/common/back_button.dart';
import 'package:zelenbank/layers/presentation/controllers/transaction_controller.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/app_bar_method.dart';
import '../../../../../core/injector/injector.dart';
import '../components/share_button_widget.dart';
import '../components/transaction_details_field_widget.dart';
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RepaintBoundary(
                      key: previewContainer,
                      child: Container(
                        color: kPlainWhite,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Comprovante',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Divider(
                                thickness: 2.2,
                                height: 25,
                              ),
                              TransactionDetailsFieldWidget(
                                fieldTitle: 'Tipo de movimentação',
                                fieldDescription:
                                    transactionTypeMap[data.transactionType]!,
                              ),
                              TransactionDetailsFieldWidget(
                                fieldTitle: 'Valor',
                                fieldDescription:
                                    'R\$ ${transactionFormattedValue(data.amount)}',
                              ),
                              TransactionDetailsFieldWidget(
                                fieldTitle:
                                    _transactionController.isReceived(data)
                                        ? 'Pagador'
                                        : 'Recebedor',
                                fieldDescription: data.targetName,
                              ),
                              data.bankName != null
                                  ? TransactionDetailsFieldWidget(
                                      fieldTitle: 'Instituição bancária',
                                      fieldDescription: data.bankName!,
                                    )
                                  : Container(),
                              TransactionDetailsFieldWidget(
                                fieldTitle: 'Data/Hora',
                                fieldDescription:
                                    DateFormat('d/MM/yyyy - HH:mm:ss')
                                        .format(data.createdAt),
                              ),
                              TransactionDetailsFieldWidget(
                                fieldTitle: 'Autenticação',
                                fieldDescription: data.authentication!,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      child: ShareButtonWidget(
                        previewContainer: previewContainer,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  String transactionFormattedValue(double value) {
    return value.toStringAsFixed(2).replaceAll('.', ',');
  }
}
