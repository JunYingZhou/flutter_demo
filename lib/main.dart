import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: RyanChowCard(),
  ));
}

class RyanChowCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('RyanChow ID Card',
        style: TextStyle(
          color: Colors.white
        ),
        ),
        centerTitle: true, // 居中
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/car.jpg'),
                radius: 40.0,
              ),
            ),
            Divider(height: 50.0, color: Colors.grey[800]),
            Text('NAME',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0
              ),
            ),
            SizedBox(height: 2.0),
            Text('RyanChow',
              style: TextStyle(
                color: Colors.amber,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'RubikVinyl'
              ),
            ),
            SizedBox(height: 15.0),
            Text('CURRENT LEVEL',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0
              ),
            ),
            SizedBox(height: 2.0),
            Text('InternShip',
              style: TextStyle(
                  color: Colors.amber,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RubikVinyl'
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                    'RyanChow4545@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[400],
                    letterSpacing: 1.0,
                    fontSize: 18.0
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}