import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_one/core/utils/app_colors.dart';
import 'package:project_one/data/model/home_tab_response_model.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeAdsSlider extends StatelessWidget {
  final List<AdsResponseModel> ads;

  const HomeAdsSlider({super.key, required this.ads});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    if (ads.isEmpty) return const SizedBox();

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: ImageSlideshow(
        height: media.height*.18,
        width: double.infinity,
        indicatorColor: AppColors.primaryColor,
        isLoop: true,
        indicatorBackgroundColor:Colors.grey,
        indicatorBottomPadding: 16,
        initialPage: 0,
        autoPlayInterval: 3000,
        children: ads.map((ad) {
          return ClipRRect(
            borderRadius:BorderRadius.circular(44),
            child: CachedNetworkImage(
              imageUrl: ad.image ?? "",
              height: 200,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                      Colors.transparent,
                      BlendMode.colorBurn,
                    ),
                  ),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, size: 40, color: Colors.blue),
            ),
          );
        }).toList(),
      ),
    );
  }
}
