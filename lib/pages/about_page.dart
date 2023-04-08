import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/cart.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Scaffold(
              body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About us',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Image.asset(
                        "assets/images/about.png",
                      ),
                    ),
                    const Center(
                      child: Text(
                        "The Supreme shop on lafayette in 2000",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Supreme is an American clothing and skateboarding lifestyle brand established in New York City in April 1994.",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontSize: 16),
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          'Contact us',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        )
                      ],
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_on),
                      title: const Text('Binh Thuy'),
                      subtitle: const Text('Can Tho, Viet Nam'),
                      onTap: () => launchUrl(Uri.parse(
                          'https://www.google.com/maps/d/embed?mid=1DPhdGChjMtier-yWCPVNynsQYXo&hl=vi&ehbc=2E312F')),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('(123) 456-7890'),
                      onTap: () =>
                          launchUrl(Uri(scheme: 'tel', path: '1234567890')),
                    ),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('thphatt@gmail.com'),
                      onTap: () => launchUrl(Uri(
                        scheme: 'mailto',
                        path: 'thphatt@gmail.com',
                      )),
                    ),
                  ],
                ),
              ),
            ));
  }
}
