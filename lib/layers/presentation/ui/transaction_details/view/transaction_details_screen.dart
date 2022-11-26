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
                              const Divider(
                                thickness: 2.2,
                                height: 25,
                              ),
                              const Text(
                                'Tipo de Movimentação',
                                style: TextStyle(
                                  height: 2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                transactionTypeMap[data.transactionType]!,
                                style: const TextStyle(
                                  height: 1.7,
                                ),
                              ),
                              const Text(
                                'Valor',
                                style: TextStyle(
                                  height: 3.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'R\$${data.amount.toString()}',
                                style: const TextStyle(
                                  height: 1.7,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TransactionType(
                                transactionController: _transactionController,
                                data: data,
                              ),
                              Text(
                                data.targetName,
                                style: const TextStyle(
                                  height: 2,
                                ),
                              ),
                              BankName(data.bankName),
                              const Text(
                                'Data/Hora',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  height: 3.5,
                                ),
                              ),
                              Text(
                                data.createdAt.toString(),
                                style: const TextStyle(
                                  height: 1.7,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Authentication(),
                              data.authentication != null
                                  ? Text(data.authentication!)
                                  : Container(),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: ElevatedButton(
                                    onPressed: () =>
                                        shareImage(previewContainer),
                                    style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        foregroundColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        fixedSize: Size(
                                            MediaQuery.of(context).size.width,
                                            50),
                                        shadowColor: Colors.transparent),
                                    child: const Text('Compartilhar')),
                              ),
                            ]),
                      ),
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
