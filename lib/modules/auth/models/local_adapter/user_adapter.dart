import 'package:hive/hive.dart';
import 'package:skeleton/modules/auth/models/user_local_model.dart';

class UserAdapter extends TypeAdapter<UserLocal> {
  @override
  final int typeId = 1; // Unique ID for your userLocal model

  @override
  UserLocal read(BinaryReader reader) {
    return UserLocal(
      name: reader.read() as String,
      lastname: reader.read() as String,
      email: reader.read() as String,
      pass: reader.read() as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserLocal obj) {
    writer.write(obj.name);
    writer.write(obj.lastname);
    writer.write(obj.email);
    writer.write(obj.pass);
  }
}
