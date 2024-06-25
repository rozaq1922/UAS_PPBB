import 'package:flutter/material.dart';
import 'package:uas_prak/api_service.dart';
import 'package:uas_prak/models/stadium_model.dart';

class StadiumListScreen extends StatefulWidget {
  @override
  _StadiumListScreenState createState() => _StadiumListScreenState();
}

class _StadiumListScreenState extends State<StadiumListScreen> {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Stadium'),
      ),
      body: FutureBuilder<List<Stadium>>(
        future: _apiService.getStadium(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('Tidak ada data stadium.'),
              );
            } else {
              List<Stadium> stadiumList = snapshot.data!;
              return ListView.builder(
                itemCount: stadiumList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(stadiumList[index].name ?? ''),
                      subtitle: Text('Kode: ${stadiumList[index].kode ?? ''}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StadiumDetailScreen(
                              stadium: stadiumList[index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}

class StadiumDetailScreen extends StatelessWidget {
  final Stadium stadium;

  StadiumDetailScreen({required this.stadium});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stadium.name ?? 'Detail Stadium'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Id: ${stadium.id ?? ''}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Name: ${stadium.name ?? ''}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Kode: ${stadium.kode ?? ''}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Jumlah: ${stadium.jumlah ?? ''}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Category ID: ${stadium.categoryId ?? ''}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Created At: ${stadium.createdAt != null ? stadium.createdAt!.toString() : ''}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Updated At: ${stadium.updatedAt != null ? stadium.updatedAt!.toString() : ''}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
