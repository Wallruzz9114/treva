import 'package:flutter/material.dart';
import 'package:treva/src/components/carousel/carousel.dart';
import 'package:treva/src/components/countdown/countdown.dart';
import 'package:treva/src/models/grid_item.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  /// Declare class GridItem from HomeGridItemReoomended.dart in folder ListItem
  GridItem gridItem;
  bool isStarted = false;
  dynamic hoursSub, minuteSub, secondSub;
  /// CountDown for timer
  CountDown hours, minutes, seconds;
  int hourstime, minute, second = 0;
  List<GridItem> gridItemArray = <GridItem>[
    GridItem(
      id: '1',
      img: 'assets/imgItem/fashion1.jpg',
      title: 'Firrona Skirt!',
      price: '\$ 10',
      itemSale: '932 Sale',
      rattingValue: '4.8',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....',
    ),
    GridItem(
      id: '2',
      img: 'assets/imgItem/acesoris1.jpg',
      title: 'Arpenaz 4 Family Camping',
      price: '\$ 200',
      itemSale: '892 Sale',
      rattingValue: '4.2',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....',
    ),
    GridItem(
      id: '3',
      img: 'assets/imgItem/beauty1.jpg',
      title: 'Mizzu Valipcious Liner Vintage',
      price: '\$ 4',
      itemSale: '1422 Sale',
      rattingValue: '4.7',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....',
    ),
    GridItem(
      id: '4',
      img: 'assets/imgItem/man1.jpg',
      title: 'MENTLI Solid Blue Slim Fit',
      price: '\$ 15',
      itemSale: '523 Sale',
      rattingValue: '4.4',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....',
    ),
    GridItem(
      id: '5',
      img: 'assets/imgItem/girl1.jpg',
      title: 'Korea Choker The Black',
      price: '\$ 20',
      itemSale: '130 Sale',
      rattingValue: '4.5',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....',
    ),
    GridItem(
      id: '6',
      img: 'assets/imgItem/kids1.jpg',
      title: 'Mon Cheri Pinguin',
      price: '\$ 3',
      itemSale: '110 Sale',
      rattingValue: '4.8',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....',
    ),
    GridItem(
      id: '7',
      img: 'assets/imgItem/shoes1.jpg',
      title: 'Dr. Kevin Women Casual Boots',
      price: '\$ 15',
      itemSale: '654 Sale',
      rattingValue: '4.1',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....',
    ),
    GridItem(
      id: '8',
      img: 'assets/imgItem/shoes2.jpg',
      title: 'Gino Mariani Zenon',
      price: '\$ 100',
      itemSale: '1542 Sale',
      rattingValue: '4.1',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....',
    ),
  ];

  /// Set for StartStopPress CountDown
  void onStartStopPress() {
    secondSub ??= seconds.stream.listen(null);
    secondSub.onData((Duration d) {
      print(d);
      setState(() {
        second = d.inSeconds;
      });
    });

    minuteSub ??= minutes.stream.listen(null);
    minuteSub.onData((Duration d) {
      print(d);
      setState(() {
        minute = d.inMinutes;
      });
    });

    hoursSub ??= hours.stream.listen(null);
    hoursSub.onData((Duration d) {
      print(d);
      setState(() {
        hourstime = d.inHours;
      });
    });
  }

  @override
  void initState() {
    hours = CountDown(Duration(hours: 24));
    minutes = CountDown(Duration(hours: 1));
    seconds = CountDown(Duration(minutes: 1));

    onStartStopPress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    /// Navigation to MenuDetail.dart if user Click icon in category Menu like a example camera
    final void onClickMenuIcon = () {
      Navigator.of(context).push<dynamic>(
        PageRouteBuilder<dynamic>(
          pageBuilder: (_, __, ___) => MenuDetails(),
          transitionDuration: Duration(milliseconds: 750),
          /// Set animation with opacity
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          }
        )
      );
    };

    return Container(

    );
  }

}