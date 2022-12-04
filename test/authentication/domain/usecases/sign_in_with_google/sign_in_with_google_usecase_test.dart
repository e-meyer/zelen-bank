import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/authentication/domain/repositories/sign_in_with_google_repository.dart';
import 'package:zelenbank/authentication/domain/usecases/sign_in_with_google/sign_in_with_google_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/sign_in_with_google/sign_in_with_google_usecase_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:zelenbank/core/errors/failures/generic_failure.dart';

class MockSignInWithGoogleRepository extends Mock
    implements SignInWithGoogleRepository {}

void main() {
  late MockSignInWithGoogleRepository mockSignInWithGoogleRepository;
  late SignInWithGoogleUsecase signInWithGoogleUsecase;

  setUp(() {
    mockSignInWithGoogleRepository = MockSignInWithGoogleRepository();
    signInWithGoogleUsecase =
        SignInWithGoogleUsecaseImpl(mockSignInWithGoogleRepository);
  });

  final bool tUserSignedIn = true;

  group('sign_in_with_google_usecase', () {
    test(
        'Should return a boolean (true) from the repository if user could log in',
        () async {
      // arrange
      when(() => mockSignInWithGoogleRepository())
          .thenAnswer((_) async => Right(tUserSignedIn));
      // act
      final response = await signInWithGoogleUsecase();

      // assert
      expect(response, isA<Right>());
      expect(response, Right(true));
      verify(() => mockSignInWithGoogleRepository()).called(1);
    });

    test(
        'Should return a boolean (false) from the repository if user could not log in',
        () async {
      // arrange
      when(() => mockSignInWithGoogleRepository())
          .thenAnswer((_) async => Right(!tUserSignedIn));
      // act
      final response = await signInWithGoogleUsecase();

      // assert
      expect(response, isA<Right>());
      expect(response, Right(false));
      verify(() => mockSignInWithGoogleRepository()).called(1);
    });

    test('Should return Failure from the repository if an Exception is thrown',
        () async {
      // arrange
      when(() => mockSignInWithGoogleRepository())
          .thenAnswer((_) async => Left(GeneralFailure('Error')));
      // act
      final response = await signInWithGoogleUsecase();

      // assert
      expect(response, isA<Left>());
      verify(() => mockSignInWithGoogleRepository()).called(1);
    });
  });
}
