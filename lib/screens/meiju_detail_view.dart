import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meiju_flutter/components/request_util.dart';
import 'package:meiju_flutter/model/home_grid_item.dart';
import 'package:meiju_flutter/model/meiju_list_item.dart';
import 'package:meiju_flutter/screens/meiju_video_player.dart';
import 'package:meiju_flutter/screens/video_player_normal.dart';

class MeiJuDetailView extends StatefulWidget {
  const MeiJuDetailView({super.key, required this.listItem});

  final SingleMeiJuListItem listItem;

  @override
  State<MeiJuDetailView> createState() => _MeiJuDetailViewState();
}

class _MeiJuDetailViewState extends State<MeiJuDetailView> {
  final MeiJuClient client = MeiJuClient();
  HomeGridItem _item = HomeGridItem('id', 'title', 'img', 'playtime', 'otitle',
      'jianjie', 'daoyan', 'zhuyan', 'pingfen', []);

  @override
  void initState() {
    fetchDetailItem();
    super.initState();
  }

  void fetchDetailItem() async {
    final detailItem = await client.fetchMeijuXiangXi(widget.listItem.id);
    setState(() {
      _item = detailItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.listItem.title)),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 221, 214, 212),
              height: 180.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      widget.listItem.img,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 4 / 1.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: _item.list.length,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                itemBuilder: (context, index) {
                  final singleItem = _item.list[index];
                  String btnStr = '第${singleItem.zhuti}集';
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 196, 139, 123),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) {
                            // return VideoPlayer(
                            //     title: _item.title, playUrl: singleItem.bofang);
                            // return VideoApp();
                            return MeiJuVideoPalyer(
                              title: _item.title,
                              playUrl: singleItem.bofang,
                            );
                          },
                        ),
                      );
                    },
                    child: Text(btnStr),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
