import 'package:equatable/equatable.dart';

class HomeNetworkEntity extends Equatable {
  const HomeNetworkEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  @override
  List<Object?> get props => <Object?>[
        id,
        email,
        firstName,
        lastName,
        avatar
      ];
}