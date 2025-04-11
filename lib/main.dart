import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ekoiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isStarted = false; // Başlangıçta butonun görünmesi için flag

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arkaplanda doğa resmi
          Positioned.fill(
            child: Image.asset(
              'assets/images/doga.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // İçerik
          Center(
            child: _isStarted
                ? _buildOptions() // "Başla" butonuna tıklandığında seçenekler
                : _buildStartButton(), // Başlangıç ekranı
          ),
        ],
      ),
    );
  }

  // "Başla" butonunun olduğu ekran
  Widget _buildStartButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isStarted = true; // "Başla" butonuna tıklandığında seçenekler gösterilsin
        });
      },
      child: Text(
        'Başla',
        style: TextStyle(fontSize: 24),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // Button color
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      ),
    );
  }

  // Seçenekler ekranı
  Widget _buildOptions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Resim seçenekleri (Bus, Car, Walk vb.)
        _buildImageOption('Bus', 'assets/images/bus.png'),
        _buildImageOption('Car', 'assets/images/car.png'),
        _buildImageOption('Walk', 'assets/images/walk.png'),
        // Diğer seçenekler
        _buildImageOption('Doga', 'assets/images/doga.jpg'),
      ],
    );
  }

  // Resimleri gösterecek widget
  Widget _buildImageOption(String title, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: () {
          // Seçim yapıldığında yapılacak işlem
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title seçildi!')),
          );
        },
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
