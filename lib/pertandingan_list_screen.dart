import 'package:flutter/material.dart';
import 'package:uas_prak/api_service.dart';
import 'package:uas_prak/models/pertandingan_model.dart';

void main() {
  runApp(MaterialApp(
    home: PertandinganListScreen(),
  ));
}

class PertandinganListScreen extends StatefulWidget {
  @override
  _PertandinganListScreenState createState() => _PertandinganListScreenState();
}

class _PertandinganListScreenState extends State<PertandinganListScreen> {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Pertandingan'),
      ),
      body: FutureBuilder<List<Pertandingan>>(
        future: _apiService.getPertandingan(),
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
                child: Text('Tidak ada data pertandingan.'),
              );
            } else {
              List<Pertandingan> pertandinganList = snapshot.data!;
              return ListView.builder(
                itemCount: pertandinganList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(pertandinganList[index].tujuan ?? ''),
                      subtitle: Text(pertandinganList[index].start ?? ''),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PertandinganDetailScreen(
                                pertandingan: pertandinganList[index]),
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

class PertandinganDetailScreen extends StatelessWidget {
  final Pertandingan pertandingan;

  PertandinganDetailScreen({required this.pertandingan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pertandingan.tujuan ?? 'Detail Pertandingan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Id', pertandingan.id?.toString() ?? ''),
            _buildDetailRow('Tujuan', pertandingan.tujuan ?? ''),
            _buildDetailRow('Start', pertandingan.start ?? ''),
            _buildDetailRow('End', pertandingan.end ?? ''),
            _buildDetailRow('Harga', pertandingan.harga?.toString() ?? ''),
            _buildDetailRow('Jam', _formatDateTime(pertandingan.jam)),
            _buildDetailRow('Transportasi ID',
                pertandingan.transportasiId?.toString() ?? ''),
            _buildDetailRow(
                'Created At',
                pertandingan.createdAt != null
                    ? pertandingan.createdAt!.toString()
                    : ''),
            _buildDetailRow(
                'Updated At',
                pertandingan.updatedAt != null
                    ? pertandingan.updatedAt!.toString()
                    : ''),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
    } else {
      return '';
    }
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
