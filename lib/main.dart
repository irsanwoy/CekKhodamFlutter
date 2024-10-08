import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cek Khodam',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  String _khodamResult = '';

  // Logika sederhana untuk cek khodam berdasarkan nama
  void _cekKhodam() {
    String name = _nameController.text.trim().toLowerCase();
    setState(() {
      if (name.isEmpty) {
        _khodamResult = 'Masukkan namamu untuk memanggil khodam...';
      } else {
        _khodamResult = 'Khodam dari $name: ';
        // Tambahkan nama khodam secara acak
        List<String> khodamList = [
          'Dadar Gulung',
          'Siluman gagang Panto',
          'Agus Suheri',
          'Tarmin Botak',
          
        ];
        _khodamResult += khodamList[name.length % khodamList.length];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Cek Khodam Seram', style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          // Background gambar Nyai Roro Kidul
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('nyirorokidul.jpg'), // Pastikan Anda menambahkan gambar ini ke folder assets
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay dengan sedikit transparansi untuk membuat teks lebih mudah terbaca
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          // Konten utama
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Masukkan Nama Untuk Cek Khodam:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(blurRadius: 10, color: Colors.red, offset: Offset(2, 2))],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _nameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      hintText: 'Masukkan namamu...',
                      hintStyle: const TextStyle(color: Colors.white60),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _cekKhodam,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text('Cek Khodam'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _khodamResult,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(blurRadius: 10, color: Colors.red, offset: Offset(2, 2)),
                        Shadow(blurRadius: 15, color: Colors.black, offset: Offset(-2, -2)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
