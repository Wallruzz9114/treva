import 'dart:async';
import 'package:flutter/material.dart';
import 'package:treva/src/components/carousel/src/dots_indicator.dart';

class Carousel extends StatefulWidget {

  const Carousel({
    @required this.images,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(milliseconds: 300),
    this.dotSize = 8.0,
    this.dotSpacing = 25.0,
    this.dotIncreaseSize = 2.0,
    this.dotColor = Colors.white,
    this.dotBgColor,
    this.showIndicator = true,
    this.indicatorBgPadding = 20.0,
    this.boxFit = BoxFit.cover,
    this.borderRadius = false,
    this.radius,
    this.moveIndicatorFromBottom = 0.0,
    this.noRadiusForIndicator = false,
    this.overlayShadow = false,
    this.overlayShadowColors,
    this.overlayShadowSize = 0.5,
    this.autoplay = true,
    this.autoplayDuration = const Duration(seconds: 3)
  }) : assert(images != null),
      assert(animationCurve != null),
      assert(animationDuration != null),
      assert(dotSize != null),
      assert(dotSpacing != null),
      assert(dotIncreaseSize != null),
      assert(dotColor != null);

  //All the images on this Carousel.
  final List<dynamic> images;

  //The transition animation timing curve. Default is [Curves.ease]
  final Curve animationCurve;

  //The transition animation duration. Default is 300ms.
  final Duration animationDuration;

  // The base size of the dots. Default is 8.0
  final double dotSize;

  // The increase in the size of the selected dot. Default is 2.0
  final double dotIncreaseSize;

  // The distance between the center of each dot. Default is 25.0
  final double dotSpacing;

  // The Color of each dot. Default is Colors.white
  final Color dotColor;

  // The background Color of the dots. Default is [Colors.grey[800].withOpacity(0.5)]
  final Color dotBgColor;

  // Enable or Disable the indicator (dots). Default is true
  final bool showIndicator;

  //Padding Size of the background Indicator. Default is 20.0
  final double indicatorBgPadding;

  //How to show the images in the box. Default is cover
  final BoxFit boxFit;

  //Enable/Disable radius Border for the images. Default is false
  final bool borderRadius;

  //Border Radius of the images. Default is [Radius.circular(8.0)]
  final Radius radius;

  //Move the Indicator From the Bottom
  final double moveIndicatorFromBottom;

  //Remove the radius bottom from the indicator background. Default false
  final bool noRadiusForIndicator;

  //Enable/Disable Image Overlay Shadow. Default false
  final bool overlayShadow;

  //Choose the color of the overlay Shadow color. Default Colors.grey[800]
  final Color overlayShadowColors;

  //Choose the size of the Overlay Shadow, from 0.0 to 1.0. Default 0.5
  final double overlayShadowSize;

  //Enable/Disable the auto play of the slider. Default true
  final bool autoplay;

  //Duration of the Auto play slider by seconds. Default 3 seconds
  final Duration autoplayDuration;

  @override
  _CarouselState createState() => _CarouselState();

}

class _CarouselState extends State<Carousel> {

  PageController _controller = PageController();
  Timer timer;

  @override
  void initState() {
    super.initState();

    if (widget.autoplay) {
      timer = Timer.periodic(widget.autoplayDuration, (_) {
        if (_controller.page == widget.images.length - 1) {
          _controller.animateToPage(
            0,
            duration: widget.animationDuration,
            curve: widget.animationCurve,
          );
        } else {
          _controller.nextPage(duration: widget.animationDuration, curve: widget.animationCurve);
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller = null;
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listImages = widget.images.map<Widget>(
      (dynamic netImage) => netImage is ImageProvider ? Container(
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius ? BorderRadius.all(
            widget.radius != null ? widget.radius : const Radius.circular(8.0)
          ) : null,
          image: DecorationImage(
            // colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: netImage,
            fit: widget.boxFit,
          )
        ),
        child: widget.overlayShadow ? Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              stops: <double>[0.0, widget.overlayShadowSize],
              colors: <Color>[
                widget.overlayShadowColors != null ? widget.overlayShadowColors.withOpacity(1.0) : Colors.grey[800].withOpacity(1.0),
                widget.overlayShadowColors != null ? widget.overlayShadowColors.withOpacity(0.0): Colors.grey[800].withOpacity(0.0)
              ],
            ),
          ),
        ): Container(),
      ): netImage,
    ).toList();

    return Stack(
      children: <Widget>[
        Container(
          child: PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _controller,
            children: listImages,
          ),
        ),
        widget.showIndicator ? Positioned(
          bottom: widget.moveIndicatorFromBottom,
          left: 0.0,
          right: 0.0,
          child: Container(
            decoration: BoxDecoration(
              color: widget.dotBgColor == null ? Colors.grey[800].withOpacity(0.5) : widget.dotBgColor,
              borderRadius: widget.borderRadius ? (
                widget.noRadiusForIndicator ? null : BorderRadius.only(
                  bottomLeft: widget.radius != null ? widget.radius : const Radius.circular(8.0),
                  bottomRight: widget.radius != null ? widget.radius : const Radius.circular(8.0)
                )
              ) : null,
            ),
            padding: EdgeInsets.all(widget.indicatorBgPadding),
            child: Center(
              child: DotsIndicator(
                controller: _controller,
                itemCount: listImages.length,
                color: widget.dotColor,
                dotSize: widget.dotSize,
                dotSpacing: widget.dotSpacing,
                dotIncreaseSize: widget.dotIncreaseSize,
                onPageSelected: (int page) {
                  _controller.animateToPage(
                    page,
                    duration: widget.animationDuration,
                    curve: widget.animationCurve,
                  );
                },
              ),
            ),
          ),
        ): Container(),
      ],
    );
  }
  
}