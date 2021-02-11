import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:spacex_app/feature/launch_detail_screen/widgets/large_image_placeholder_widget.dart';

class LargePatchImageWidget extends StatelessWidget {
  final String imageUrl;

  const LargePatchImageWidget({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        height: 200,
        width: 200,
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? "",
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => LargeImagePlaceHolderWidget(),
          errorWidget: (context, url, error) => LargeImagePlaceHolderWidget(),
        ),
      ),
    );
  }
}
