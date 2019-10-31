import 'package:abc/global/global.dart';
import 'package:abc/ui/item/bottom_item.dart';
import 'package:abc/ui/item/common_item.dart';
import 'package:flutter/material.dart';

class MyPageContent extends StatefulWidget {
  @override
  _MyPageContentState createState() => _MyPageContentState();
}

class _MyPageContentState extends State<MyPageContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BottomItem(
                text: "我的客服",
                child: Icon(Icons.people),
              ),
              BottomItem(
                text: "学习中心",
                child: Icon(Icons.center_focus_weak),
              ),
              BottomItem(
                text: "福利社",
                child: Icon(Icons.present_to_all),
              )
            ],
          ),
        ),
        //按钮列
        Expanded(
            child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            buildButton(context),
          ],
        )),
      ],
    );
  }

  Widget buildButton(BuildContext context) {
    var hPadding = 15.0;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        CommonItem(
          decroate: CommonItemDecroate(
              vMargin: hPadding,
              backgroundColor: Colors.white,
              underlineColor: Colors.transparent,
              left: Icon(Icons.attach_money),
              center: Text("钱包"),
              right: Row(
                children: <Widget>[
                  Text("请绑定支付宝"),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[300],
                  )
                ],
              )),
        ),
        SizedBox(
          height: 5,
        ),
        CommonItem(
          decroate: CommonItemDecroate(
            vMargin: hPadding,
            backgroundColor: Colors.white,
            left: Icon(Icons.local_see),
            underlineLeftPadding: 45,
            center: Text("发现"),
            right: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[300],
            ),
          ),
        ),
        CommonItem(
          decroate: CommonItemDecroate(
            vMargin: hPadding,
            backgroundColor: Colors.white,
            left: Icon(Icons.store),
            underlineLeftPadding: 45,
            center: Text("收藏"),
            right: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[300],
            ),
          ),
        ),
        CommonItem(
          decroate: CommonItemDecroate(
            vMargin: hPadding,
            backgroundColor: Colors.white,
            left: Icon(Icons.account_box),
            underlineLeftPadding: 45,
            center: Text("邀请"),
            underlineColor: Colors.transparent,
            right: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[300],
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        CommonItem(
          decroate: CommonItemDecroate(
            vMargin: hPadding,
            backgroundColor: Colors.white,
            left: Icon(Icons.settings),
            underlineLeftPadding: 45,
            center: Text("设置"),
            underlineColor: Colors.transparent,
            right: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[300],
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        CommonItem(
          decroate: CommonItemDecroate(
            vMargin: hPadding,
            backgroundColor: Colors.white,
            left: Icon(Icons.photo_size_select_small),
            underlineLeftPadding: 45,
            center: Text("小程序"),
            underlineColor: Colors.transparent,
            right: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[300],
            ),
          ),
        ),
      ],
    );
  }
}
