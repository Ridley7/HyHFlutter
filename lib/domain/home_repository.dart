import 'package:hiberus_university/models/home_screen/item_menu.dart';


abstract class HomeRepository{
  Future<List<ItemMenu>> getMainMenu();
}