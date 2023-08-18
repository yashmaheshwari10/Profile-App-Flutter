import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.amber,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              centerTitle: true,
              title: Text("Profile",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 20,
            ),
            ProfilePicture(
              name: "Yash Maheshwari",
              radius: 45,
              fontsize: 21,
              img:
                  'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcTOQGx2jU4L4mDCrkwWjqeg6I50JgdsPPWgM9z0nbwUtuTu4bple1U57iLhA3N0ypkNSyKZrIPSp08vh9A',
              tooltip: true,
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(children: [
                  Container(
                    height: 200,
                    width: 200000,
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/WhatsApp Image 2023-08-16 at 10.47.07 PM(2).jpeg",
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              "Name: Yash Maheshwari",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Contact: 911",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Mail: yash.maheshwari22",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "@vit.edu",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ])),
            ElevatedButton.icon(
                onPressed: () async {
                  final url = Uri.parse(
                      'https://www.linkedin.com/in/yash-maheshwari-64750825a/');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                icon: Icon(Icons.work),
                label: Text("Linkedin")),
          ],
        ),
      ),
    );
  }
}
