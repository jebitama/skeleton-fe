import 'package:hive/hive.dart';
part 'user_local_model.g.dart';

@HiveType(typeId: 1) // Specify a unique typeId for your User class
class UserLocal {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? lastname;
  @HiveField(2)
  late String email;
  @HiveField(3)
  late String pass;

  UserLocal({
    this.name,
    this.lastname,
    required this.email,
    required this.pass,
  });
}
