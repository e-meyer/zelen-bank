import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zelenbank/core/share_image/share_image.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/presentation/ui/common/back_button.dart';
import 'package:zelenbank/layers/presentation/controllers/transaction_controller.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/app_bar_method.dart';
import '../../../../../core/injector/injector.dart';
import '../components/custom_button_widget.dart';
import '../components/transaction_details_field_widget.dart';
import '../components/transaction_details_loading_widget.dart';

// ignore: must_be_immutable
class TransactionDetails extends StatefulWidget {
  final String id;

  TransactionDetails(this.id, {Key? key}) : super(key: key);

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  final TransactionController _transactionController =
      serviceLocator.get<TransactionController>();

  GlobalKey previewContainer = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _transactionController.getTransactionById(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(titulo: '', leading: const CustomBackButton()),
      body: AnimatedBuilder(
        animation: _transactionController,
        builder: (context, snapshot) {
          TransactionEntity? data = _transactionController.detailedTransaction;
          if (data != null) {
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
                                fieldDescription: data.description,
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
                      child: CustomButtonWidget(
                        label: 'Compartilhar',
                        previewContainer: previewContainer,
                        onTap: () {
                          return shareImage(previewContainer);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Padding(
            padding: const EdgeInsets.only(top: 45),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const TransactionDetailsLoadingWidget();
              },
              itemCount: 8,
            ),
          );
        },
      ),
    );
  }

  String transactionFormattedValue(double value) {
    return value.toStringAsFixed(2).replaceAll('.', ',');
  }
}
