import 'package:flutter/material.dart';
import 'package:meiju_flutter/model/meiju_list_item.dart';
import 'package:meiju_flutter/screens/home_grid_single_view.dart';

class HomeGridView extends StatefulWidget {
  const HomeGridView({
    super.key,
    required this.dataList,
    required this.tapped,
  });

  final List<SingleMeiJuListItem> dataList;
  final void Function(SingleMeiJuListItem item) tapped;
  @override
  State<HomeGridView> createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3 / 5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      padding: const EdgeInsets.all(20),
      itemCount: widget.dataList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final item = widget.dataList[index];
        return HomeGridSingleView(
          imgUrl: item.img,
          title: item.title,
          zhuti: item.zhuti,
          tapped: () {
            widget.tapped(item);
          },
        );
      },
    );
  }
}
