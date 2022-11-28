import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/layers/domain/repositories/get_current_balance_repository.dart';
import 'package:zelenbank/layers/domain/usecases/get_current_balance_usecase/get_current_balance_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_current_balance_usecase/get_current_balance_usecase_impl.dart';

class MockGetCurrentBalanceRepository extends Mock
    implements GetCurrentBalanceRepository {}

void main() {
  late MockGetCurrentBalanceRepository mockGetCurrentBalanceRepository;
  late GetCurrentBalanceUsecase getCurrentBalanceUsecase;

  setUp(() {
    mockGetCurrentBalanceRepository = MockGetCurrentBalanceRepository();
    getCurrentBalanceUsecase =
        GetCurrentBalanceUsecaseImpl(mockGetCurrentBalanceRepository);
  });

  const double tNumber = 1;

  test('Should get a double number from the repository', () async {
    // arrange
    when(() => mockGetCurrentBalanceRepository())
        .thenAnswer((_) async => Right(tNumber));

    // act
    final result = await getCurrentBalanceUsecase();

    // assert
    expect(result, isA<double>());
    verify(() => mockGetCurrentBalanceRepository()).called(1);
  });
}
