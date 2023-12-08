import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

class Admobwidget extends StatefulWidget {
  const Admobwidget({super.key});

  @override
  State<Admobwidget> createState() => _AdmobwidgetState();
}

class _AdmobwidgetState extends State<Admobwidget> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId =
      Platform.isAndroid ? 'ca-app-pub-1431555144006060/1757785287' : '';

  /// Loads a banner ad.
  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          setState(() {
            _isLoaded = false;
          });
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void initState() {
    loadAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (_isLoaded) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            child: SizedBox(
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
          ),
        );
      } else {
        return GestureDetector(
          onTap: () {
            launchUrl(Uri.parse("https://invia.com.br/cert/suporte.html"),
                mode: LaunchMode.externalApplication);
          },
          child: Image.asset("images/logoinvia.png"),
        );
      }
    });
  }
}
