class HomeGridItem {
  final String iid;
  final String title;
  final String img;
  final String playtime;
  final String? otitle;
  final String? jianjie;
  final String? daoyan;
  final String? zhuyan;
  final String? pingfen;
  List<HomeGridSingleItem> list;

  HomeGridItem(this.iid, this.title, this.img, this.playtime, this.otitle,
      this.jianjie, this.daoyan, this.zhuyan, this.pingfen, this.list);

  factory HomeGridItem.fromJson(Map<String, dynamic> jsonResponse) {
    return HomeGridItem(
      jsonResponse['iid'],
      jsonResponse['title'],
      jsonResponse['img'],
      jsonResponse['playtime'],
      jsonResponse['otitle'],
      jsonResponse['jianjie'],
      jsonResponse['daoyan'],
      jsonResponse['zhuyan'],
      jsonResponse['pingfen'],
      (jsonResponse['list'] as List)
          .map((e) => HomeGridSingleItem.fromJson(e))
          .toList(),
    );
  }
}

class HomeGridSingleItem {
  final String zhuti;
  final String bofang;
  final String? down;

  HomeGridSingleItem(this.zhuti, this.bofang, this.down);

  factory HomeGridSingleItem.fromJson(Map<String, dynamic> jsonResponse) {
    return HomeGridSingleItem(
      jsonResponse['zhuti'],
      jsonResponse['bofang'],
      jsonResponse['down'],
    );
  }
}
