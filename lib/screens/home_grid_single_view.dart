import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeGridSingleView extends StatefulWidget {
  const HomeGridSingleView({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.zhuti,
    required this.tapped,
  });

  final String imgUrl;
  final String title;
  final String? zhuti;
  final void Function() tapped;

  @override
  State<HomeGridSingleView> createState() => _HomeGridSingleViewState();
}

class _HomeGridSingleViewState extends State<HomeGridSingleView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.tapped();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Image.network(
                  widget.imgUrl,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                  child: Text(
                    widget.zhuti != null ? widget.zhuti! : '',
                    style: TextStyle(
                      background: Paint()
                        ..color = Colors.red
                        ..strokeWidth = 15
                        ..strokeJoin = StrokeJoin.round
                        ..strokeCap = StrokeCap.round
                        ..style = PaintingStyle.stroke,
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
