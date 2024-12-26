import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilPage extends StatelessWidget {
  final String name = "Badeche Abdennour";
  final String bio = "Développeur Flutter";
  final String imageUrl = "assets/images/profile_image.png";
  final List<Map<String, String>> links = [
    {
      "label": "LinkedIn",
      "url": "https://www.linkedin.com/in/badeche-abdennour"
    },
    {"label": "GitHub", "url": "https://www.github.com/abdouBadeche"},
    {"label": "Portfolio", "url": "https://www.abdennourbadeche.com"},
    {"label": "Twitter", "url": "https://www.twitter.com/abdouBadeche"},
    {"label": "Instagram", "url": "https://www.instagram.com/abdouBadeche"},
  ];

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage(imageUrl),
                ),
                SizedBox(height: 16),
                Text(
                  name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  bio,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Divider(),
                Column(
                  children: links.map((link) {
                    return ListTile(
                      leading: Icon(Icons.link),
                      title: Text(link['label']!),
                      subtitle: Text(link['url']!),
                      onTap: () => _launchUrl(link['url']!),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
