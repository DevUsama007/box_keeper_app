import 'package:hive/hive.dart';

part 'Boxes_model.g.dart';

@HiveType(typeId: 1)
class BoxesModel extends HiveObject {
  @HiveField(0)
  String uniqueID;
  @HiveField(1)
  String qrCodePath;
  @HiveField(2)
  String boxTitle;
  @HiveField(3)
  String boxLocation;
  @HiveField(4)
  String boxCreationDate;
  @HiveField(5)
  List<String> boxItems;
  @HiveField(6)
  int itemCount;
  BoxesModel({
    required this.uniqueID,
    required this.qrCodePath,
    required this.boxTitle,
    required this.boxLocation,
    required this.boxCreationDate,
    required this.boxItems,
    required this.itemCount,
  });
  @override
  String toString() {
    return '''
BoxesModel(
  uniqueID: $uniqueID,
  qrCodePath: $qrCodePath,
  boxTitle: $boxTitle,
  boxLocation: $boxLocation,
  boxCreationDate: $boxCreationDate,
  itemCount: $itemCount,
  boxItems: $boxItems
)
''';
  }
}
