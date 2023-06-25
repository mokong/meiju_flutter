import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meiju_flutter/components/request_util.dart';
import 'package:meiju_flutter/model/meiju_list_item.dart';
import 'package:meiju_flutter/screens/home_grid_single_view.dart';
import 'package:meiju_flutter/screens/home_swiper.dart';
import 'package:meiju_flutter/screens/meiju_detail_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScrollView extends StatefulWidget {
  const HomeScrollView({super.key});

  @override
  State<HomeScrollView> createState() => _HomeScrollViewState();
}

class _HomeScrollViewState extends State<HomeScrollView> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final MeiJuClient client = MeiJuClient();
  int pageNum = 1;
  MeiJuListItem _item = MeiJuListItem(list: [], lunbo: []);

  @override
  void initState() {
    fetchListItem();
    super.initState();
  }

  void fetchListItem() async {
    final listItem = await client.fetchMeijuList(pageNum);
    List<SingleMeiJuListItem> list = _item.list;
    if (pageNum > 1) {
      list += listItem.list;
    } else {
      list = listItem.list;
    }
    listItem.list = list;

    setState(() {
      _item = listItem;
    });
  }

  void tappedItem(SingleMeiJuListItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MeiJuDetailView(listItem: item),
      ),
    );
  }

  void _onRefresh() async {
    pageNum = 1;
    fetchListItem();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    pageNum += 1;
    fetchListItem();
    if (mounted) {
      setState(() {});
      _refreshController.loadComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (context, mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed! Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("release to load more");
          } else {
            body = Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(
              child: body,
            ),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: CustomScrollView(
        slivers: <Widget>[
          // SliverAppBar(
          //   pinned: false,
          //   expandedHeight: 150.0,
          //   flexibleSpace: FlexibleSpaceBar(
          //     background: HomeSwiper(
          //       dataList: widget.lunbo,
          //       tapped: (item) {
          //         widget.tapped(item);
          //       },
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: HomeSwiper(
              dataList: _item.lunbo,
              tapped: (item) {
                tappedItem(item);
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = _item.list[index];
                return HomeGridSingleView(
                  imgUrl: item.img,
                  title: item.title,
                  zhuti: item.zhuti,
                  tapped: () {
                    tappedItem(item);
                  },
                );
              }, childCount: _item.list.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 5,
                mainAxisSpacing: 15,
                crossAxisSpacing: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
