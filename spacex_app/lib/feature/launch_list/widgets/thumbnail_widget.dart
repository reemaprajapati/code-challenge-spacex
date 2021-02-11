import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:spacex_app/feature/launch_list/widgets/place_holder_image.dart';

class ThumbnailImage extends StatelessWidget {
  final String imageUrl;

  const ThumbnailImage({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(imageUrl);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      height: 50,
      width: 50,
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? "",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => PlaceHolderImage(),
        errorWidget: (context, url, error) => PlaceHolderImage(),
      ),
    );
    ;
  }
}