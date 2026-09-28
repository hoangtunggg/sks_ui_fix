import 'package:flutter/material.dart';
import 'package:flutter_application_1/booking_form_screen.dart';

class BookingHomeScreen extends StatelessWidget {
  const BookingHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.directions_bus,
                size: 80,
                color: Color.fromRGBO(14, 165, 233, 1),
              ),

              const SizedBox(height: 20),

              Center(
                child: SizedBox(
                  width: 300,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => BookingFormScreen()),
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text(
                      'ĐẶT CHUYẾN XE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
