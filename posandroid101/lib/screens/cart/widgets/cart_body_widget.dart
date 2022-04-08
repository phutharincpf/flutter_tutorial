import 'package:flutter/material.dart';
import 'package:posandroid101/constants/styles.dart';

class CartBodyWidget extends StatelessWidget {
  const CartBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullWidth = ((MediaQuery.of(context).size.width) + 40) / 3;
    double defaultPadding = 15.0;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: Styles.padding, vertical: Styles.padding/2),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(right: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${index + 1}',
                              style: Styles.title.copyWith(color: Colors.black54, fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                "โกโก้ คลาวด์ มัคคิอาโต $fullWidth",
                                style: Styles.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        border: Border.all(color: Colors.red, width: 1),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   width: fullWidth,
                    //   child: Row(
                    //     children: const [
                    //       SizedBox(width: 20),
                    //       Text('฿'),
                    //       SizedBox(width: 5),
                    //       Text('170'),
                    //       SizedBox(width: 5),
                    //       Text(
                    //         '/หน่วย',
                    //         style:
                    //         TextStyle(color: Colors.black54, fontSize: 16),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      width: 160,
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: Colors.red, width: 1),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.horizontal_rule,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Expanded(
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                              border: Border.all(color: Colors.red, width: 1),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            '฿',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '140',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 8),
    );
  }
}
