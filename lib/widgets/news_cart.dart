import 'package:flutter/material.dart';
import 'package:flutter_news_app/constants/url_constants.dart';
import 'package:url_launcher/url_launcher.dart';

_launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

getNewCart(e) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Image.network(
                e["urlToImage"].toString(),
              ),
              GestureDetector(
                onTap: () => _launchUrl(
                  e["url"],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        e["title"] ?? "...",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(e["description"] ?? "...")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      const Positioned(
          right: 10.0,
          top: 10.0,
          child: Icon(
            Icons.share,
            color: Colors.redAccent,
          ))
    ],
  );
}
