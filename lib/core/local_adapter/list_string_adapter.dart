import 'package:hive/hive.dart';

class ListStringAdapter extends TypeAdapter<List<String>> {
  @override
  final typeId = 2; // You need to assign a unique ID for each custom type

  @override
  List<String> read(BinaryReader reader) {
    final length = reader.readUint32();
    return List<String>.generate(length, (index) => reader.readString());
  }

  @override
  void write(BinaryWriter writer, List<String> obj) {
    writer.writeUint32(obj.length);
    for (final item in obj) {
      writer.writeString(item);
    }
  }
}
