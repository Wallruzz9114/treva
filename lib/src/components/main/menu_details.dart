import 'package:flutter/material.dart';
import 'package:treva/src/components/items/loading_menu_item_card.dart';
import 'package:treva/src/components/items/menu_item.dart';

class MenuDetails extends StatefulWidget {

  @override
  _MenuDetailsState createState() => _MenuDetailsState();

}

class _MenuDetailsState extends State<MenuDetails> {

  ///
  /// Get image data dummy from firebase server
  ///
  NetworkImage imageNetwork = NetworkImage(
    'https://firebasestorage.googleapis.com/v0/b/beauty-look.appspot.com/o/a.jpg?alt=media&token=e36bbee2-4bfb-4a94-bd53-4055d29358e2'
  );
  ///
  /// check the condition is right or wrong for image loaded or no
  ///
  bool loadImage = true;

  List<MenuItem> itemDiscount = <MenuItem>[
    MenuItem(
      image: 'assets/imgCamera/cameraItem1.png',
      title: 'Action Camera',
      salary: '\$ 200',
      rating: '4.8',
      sale: '923 Sale',
    ),
    MenuItem(
      image: 'assets/imgCamera/cameraItem2.png',
      title: 'Compact Camera Nicon',
      salary: '\$ 300',
      rating: '4.2',
      sale: '892 Sale',
    ),
    MenuItem(
      image: 'assets/imgCamera/cameraItem3.png',
      title: 'Canon DSLR Digital',
      salary: '\$ 500',
      rating: '4.7',
      sale: '1422 Sale',
    ),
    MenuItem(
      image: 'assets/imgCamera/cameraItem4.png',
      title: 'MENTLI Solid Blue Slim Fit',
      salary: '\$ 15',
      rating: '4.4',
      sale: '531 Sale',
    ),
    MenuItem(
      image: 'assets/imgCamera/CameraDigital.png',
      title: 'Korea Choker The Black',
      salary: '\$ 20',
      rating: '4.5',
      sale: '130 Sale',
    ),
  ];

  List<MenuItem> itemPopularData = <MenuItem>[
    MenuItem(
      image: 'assets/imgCamera/cameraItem4.png',
      title: 'Camera Nicon',
      salary: '\$ 200',
      rating: '4.8',
      sale: '923 Sale',
    ),
    MenuItem(
      image: 'assets/imgCamera/cameraItem3.png',
      title: 'SLR D1000',
      salary: '\$ 300',
      rating: '4.2',
      sale: '892 Sale',
    ),
    MenuItem(
      image: 'assets/imgCamera/cameraItem2.png',
      title: 'DSLR',
      salary: '\$ 500',
      rating: '4.7',
      sale: '1422 Sale',
    ),
    MenuItem(
      image: 'assets/imgCamera/cameraItem1.png',
      title: 'Camera',
      salary: '\$ 15',
      rating: '4.4',
      sale: '531 Sale',
    ),
    MenuItem(
      image: 'assets/imgCamera/CameraDigital.png',
      title: 'Korea Choker The Black',
      salary: '\$ 20',
      rating: '4.5',
      sale: '130 Sale',
    ),
  ];

  List<MenuItem> newItems = <MenuItem>[
    MenuItem(
      image: 'assets/imgCamera/CameraDigital.png',
      title: 'Camera Digital!',
      salary: '\$ 200',
      rating: '4.8',
      sale: '923 Sale',
    ),
    MenuItem(
      image: 'assets/imgCamera/CompactCamera.png',
      title: 'Compact Camera',
      salary: '\$ 300',
      rating: '4.2',
      sale: '892 Sale',
    ),
    MenuItem(
      image: 'assets/imgCamera/ActionCamera.png',
      title: 'Action Camera',
      salary: '\$ 500',
      rating: '4.7',
      sale: '1422 Sale',
    ),
    MenuItem(
      image: 'assets/imgCamera/cameraItem4.png',
      title: 'MENTLI Camera',
      salary: '\$ 15',
      rating: '4.4',
      sale: '531 Sale',
    ),
    MenuItem(
      image: 'assets/imgCamera/CameraDigital.png',
      title: 'Korea Choker The Black',
      salary: '\$ 20',
      rating: '4.5',
      sale: '130 Sale',
    ),
  ];

  /// Custom text
  static final TextStyle _customTextStyleBlack = TextStyle(
    fontFamily: 'Gotik',
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 15.0
  );

  /// Custom Text Blue Color
  static final TextStyle _customTextStyleBlue = TextStyle(
    fontFamily: 'Gotik',
    color: const Color(0xFF6991C7),
    fontWeight: FontWeight.w700,
    fontSize: 15.0
  );

  ///
  /// SetState after imageNetwork loaded to change list card
  ///
  @override
  void initState() {
    imageNetwork.resolve(const ImageConfiguration()).addListener((_, __) {
      if (mounted) {
        setState(() {
          loadImage=false;
        });
      }
    });

    super.initState();
  }

  ///
  ///
  /// Calling imageLoading animation for set a grid layout
  ///
  ///
  Widget _loadingImageAnimation(BuildContext context){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) => LoadingMenuItemCard(),
      itemCount: itemDiscount.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }

}