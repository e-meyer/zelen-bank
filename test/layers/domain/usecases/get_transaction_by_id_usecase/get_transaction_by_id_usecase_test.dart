import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/layers/data/repositories/get_transaction_by_id_repository_impl.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/domain/usecases/get_current_balance_usecase/get_current_balance_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_current_balance_usecase/get_current_balance_usecase_impl.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_by_id/get_transaction_by_id_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_by_id/get_transaction_by_id_usecase_impl.dart';

class MockGetTransactionByIdRepository extends Mock
    implements GetTransactionByIdRepositoryImpl {}

void main() {
  late MockGetTransactionByIdRepository mockGetTransactionByIdRepository;
  late GetTransactionByIdUsecase getTransactionByIdUsecase;

  setUp(() {
    mockGetTransactionByIdRepository = MockGetTransactionByIdRepository();
    getTransactionByIdUsecase =
        GetTransactionByIdUsecaseImpl(mockGetTransactionByIdRepository);
  });

  final date = DateTime.parse('2020-11-29T03:00:00Z');

  final tTransactionDto = TransactionEntity(
    id: '0B5BFD44-0DF1-4005-A7CF-66C9C0438380',
    createdAt: date,
    amount: 1384,
    transactionType: 'TRANSFEROUT',
    description: 'Transferência realizada',
    targetName: 'Luisa Sacura',
  );

  final String tTransactionId = 'ABC123';

  test('Should get a TransactionEntity from repository', () async {
    // arrange
    when(() => mockGetTransactionByIdRepository(any()))
        .thenAnswer((_) async => tTransactionDto);

    // act
    final result = await getTransactionByIdUsecase(tTransactionId);

    // assert
    expect(result, isA<TransactionEntity>());
    verify(() => mockGetTransactionByIdRepository(tTransactionId)).called(1);
  });
}
