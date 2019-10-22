import 'package:flutter/material.dart';
import 'package:treva/src/components/items/menu_item.dart';

class MenuItemCard extends StatelessWidget {

  const MenuItemCard({ this.item });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 0.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: const Color(0xFF656565).withOpacity(0.15),
                blurRadius: 2.0,
                spreadRadius: 1.0,
              )
            ],
          ),
          child: Wrap(
            children: <Widget>[
              Container(
                width: 160.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 185.0,
                          width: 160.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD7124A),
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.circular(5.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '10%',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 1.0),),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}