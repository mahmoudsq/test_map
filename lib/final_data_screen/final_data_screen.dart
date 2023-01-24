import 'package:flutter/material.dart';
class FinalDataScreen extends StatelessWidget {
  const FinalDataScreen({Key? key,required this.name,required this.gender,required this.lat,
  required this.long,required this.mobile, required this.checked}) : super(key: key);
  final String lat,long,name,mobile,gender;
  final bool checked;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('Lat $lat')
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('long $long')
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('Name $name')
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('Mobile $mobile')
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('Gender $gender')
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text('Checked '),
                Text(checked ? 'Checked' : 'Not Checked')
              ],
            )
          ],
        ),
      ),
    );
  }
}
