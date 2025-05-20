import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey,
        backgroundColor: const Color.fromARGB(255, 217, 245, 255),
      ),
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: NetworkImage(
                "https://images.pexels.com/photos/2014773/pexels-photo-2014773.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            fit: BoxFit.cover,
          ),
          Text(
            "Good job!",
            style: TextStyle(fontSize: 36),
          ),
        ],
      ),
    );
  }
}
