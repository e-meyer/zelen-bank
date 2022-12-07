import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String name;
  final String profilePhotoUrl;

  UserEntity({
    required this.uid,
    required this.name,
    required this.profilePhotoUrl,
  });

  @override
  List<Object?> get props => [uid, name, profilePhotoUrl];
}
