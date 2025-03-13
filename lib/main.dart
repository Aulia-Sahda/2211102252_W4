import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Saya',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _warnaController = TextEditingController();
  final TextEditingController _hobiController = TextEditingController();
  final TextEditingController _asalController = TextEditingController();

  String _nama = " ";
  String _nim = " ";
  String _warna = " ";
  String _hobi = " ";
  String _asal = " ";

  void _saveData() {
    setState(() {
      _nama = _namaController.text.isNotEmpty ? _namaController.text : _nama;
      _nim = _nimController.text.isNotEmpty ? _nimController.text : _nim;
      _warna = _warnaController.text.isNotEmpty ? _warnaController.text : _warna;
      _hobi = _hobiController.text.isNotEmpty ? _hobiController.text : _hobi;
      _asal = _asalController.text.isNotEmpty ? _asalController.text : _asal;
    });

    _namaController.clear();
    _nimController.clear();
    _warnaController.clear();
    _hobiController.clear();
    _asalController.clear();
  }

  Widget _buildProfileSection(String label, String value, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: $value",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: "Masukkan $label",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _saveData,
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  List<Widget> get _pages => [
        _buildProfileSection("Nama", _nama, _namaController),
        _buildProfileSection("NIM", _nim, _nimController),
        _buildProfileSection("Warna Favorit", _warna, _warnaController),
        _buildProfileSection("Hobi", _hobi, _hobiController),
        _buildProfileSection("Asal Daerah", _asal, _asalController),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Saya')),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Nama'),
          BottomNavigationBarItem(icon: Icon(Icons.badge), label: 'NIM'),
          BottomNavigationBarItem(icon: Icon(Icons.color_lens), label: 'Warna'),
          BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Hobi'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Asal'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
