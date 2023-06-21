import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:meiju_flutter/model/meiju_list_item.dart';

class HomeSwiper extends StatefulWidget {
  const HomeSwiper({
    super.key,
    required this.dataList,
    required this.tapped,
  });

  final List<SingleMeiJuListItem> dataList;
  final void Function(SingleMeiJuListItem item) tapped;

  @override
  State<HomeSwiper> createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 221, 214, 212),
      height: 150.0,
      child: Swiper(
        itemBuilder: (context, index) {
          final item = widget.dataList[index];
          double zhutiH = item.zhuti != null ? 10.0 : 0.0;
          double jianjieH = item.jianjie != null ? 10.0 : 0.0;
          return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                    item.img,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title),
                      Padding(
                        padding: EdgeInsets.only(top: zhutiH),
                        child: Text(item.zhuti != null ? item.zhuti! : ''),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: jianjieH),
                        child: Text(
                          item.jianjie != null ? item.jianjie! : '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                )
              ]);
        },
        itemCount: widget.dataList.length,
        pagination: const SwiperPagination(),
        onTap: (index) => {widget.tapped(widget.dataList[index])},
      ),
    );
  }
}
