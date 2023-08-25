import 'package:velorant/model/home_page_model/home_page_model.dart';

class HomePageDataProvider {
  static List<HomePageModel> homeDataList = [
    HomePageModel(name: 'AGENTS', imagePath: 'assets/images/agents.png'),
    HomePageModel(name: 'WEAPONS', imagePath: 'assets/images/weapons.png'),
    HomePageModel(name: 'MAPS', imagePath: 'assets/images/maps.png'),
  ];
}
