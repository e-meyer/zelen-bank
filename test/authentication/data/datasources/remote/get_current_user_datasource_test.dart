import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zelenbank/authentication/data/datasources/remote/get_current_user_datasource_impl.dart';
import 'package:zelenbank/authentication/domain/entities/user_entity.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late GetCurrentUserDatasourceImpl getCurrentUserDatasource;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    getCurrentUserDatasource = GetCurrentUserDatasourceImpl(mockFirebaseAuth);
  });

  final UserEntity tUser = UserEntity(
    uid: 'uid',
    name: 'name',
    profilePhotoUrl: 'profilePhotoUrl',
  );

  test('', () {
    // arrange

    // act

    // assert
  });
}
