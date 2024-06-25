import 'package:flutter/material.dart';
import 'package:uas_prak/pertandingan_list_screen.dart';
import 'package:uas_prak/stadium_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App List',
      theme: ThemeData(
        primaryColor: Colors.red, // Ubah primaryColor menjadi merah
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.orangeAccent,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            // Ganti displayLarge menjadi headline6
            fontSize: 28,
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            // Ganti bodyLarge menjadi bodyText1
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pemesanan Tiket',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red.shade400,
              Colors.red.shade900
            ], // Gunakan warna merah untuk gradien
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Selamat Datang di Pemesanan Tiket!',
                style:
                    Theme.of(context).textTheme.titleLarge, // Gunakan headline6
              ),
              SizedBox(height: 30),
              _buildAnimatedCard(
                icon: Icons.sports_soccer,
                text: 'Pertandingan',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PertandinganListScreen()),
                  );
                },
              ),
              SizedBox(height: 20),
              _buildAnimatedCard(
                icon: Icons.stadium,
                text: 'Stadium',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StadiumListScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextSpan _buildStyledText(String text, Color color) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: color,
      ),
    );
  }

  Widget _buildAnimatedCard(
      {required IconData icon,
      required String text,
      required Function() onTap}) {
    return Card(
      elevation: 5, // Mengurangi sedikit elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.redAccent.withAlpha(30),
        child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: Colors.redAccent, size: 40),
              Text(
                text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.redAccent),
            ],
          ),
        ),
      ),
    );
  }
}
