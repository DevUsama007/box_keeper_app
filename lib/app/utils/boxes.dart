import 'package:box_keeper_app/app/model/hive_models/Boxes_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<BoxesModel> getBoxes() => Hive.box<BoxesModel>('BoxesData');
}
