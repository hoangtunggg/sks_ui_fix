import 'package:flutter/material.dart';
import 'package:flutter_application_1/date_text_field.dart';
import 'package:flutter_application_1/text_field_decoration.dart';
import 'package:flutter_application_1/time_text_field.dart';

class RouteManagementScreen extends StatefulWidget {
  const RouteManagementScreen({super.key});

  @override
  State<RouteManagementScreen> createState() => _RouteManagementScreenState();
}

class TripItem {
  final String time;
  final String driver;

  TripItem({required this.time, required this.driver});
}

class _RouteManagementScreenState extends State<RouteManagementScreen> {
  Widget _buildSearch() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 40,
            child: DropdownButtonFormField<String>(
              hint: Text('Chọn chuyến', style: TextStyle(fontSize: 12)),
              decoration: TextFieldDecoration.standard(
                contentPadding: EdgeInsets.all(5),
                labelText: 'Chọn chuyến',
              ),
              items: [
                const DropdownMenuItem(
                  value: 'Chuyến 1',
                  child: Text('Tiền mặt', style: TextStyle(fontSize: 12)),
                ),
                const DropdownMenuItem(
                  value: 'Chuyến 2',
                  child: Text('Tiền mặt 2', style: TextStyle(fontSize: 12)),
                ),
                const DropdownMenuItem(
                  value: 'Chuyến 3',
                  child: Text('Tiền mặt 3', style: TextStyle(fontSize: 12)),
                ),
                const DropdownMenuItem(
                  value: 'Chuyến 4',
                  child: Text('Tiền mặt 4', style: TextStyle(fontSize: 12)),
                ),
              ],
              onChanged: (String? value) {},
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 40,
            child: TimeTextField(labelText: 'Khung giờ'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(height: 40, child: DateTextField(labelText: 'Ngày')),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: 130,
          height: 40,
          child: ElevatedButton.icon(
            onPressed: () {
              // xử lý tìm kiếm
            },
            icon: const Icon(Icons.search, size: 18),
            label: const Text('Tìm kiếm', style: TextStyle(fontSize: 13)),
          ),
        ),
      ],
    );
  }

  Widget _buildResult() {
    final timeSlots = ['0', '1', '2', '3', '4', '5', '6'];
    final groupedTrips = {
      'QNHN': ['a', 'b', 'c', 'd', 'e', 'f', 'g'],
      'HNHP': ['a', 'b', 'c', 'd', 'e', 'f', 'g'],
      'HPQN': ['a', 'b', 'c', 'd', 'e', 'f', 'g'],
      'QNHO': ['a', 'b', 'c', 'd', 'e', 'f', 'g'],
      'HNHI': ['a', 'b', 'c', 'd', 'e', 'f', 'g'],
      'HPQG': ['a', 'b', 'c', 'd', 'e', 'f', 'g'],
      'QNHF': ['a', 'b', 'c', 'd', 'e', 'f', 'g'],
      'HNHV': ['a', 'b', 'c', 'd', 'e', 'f', 'g'],
      'HPQB': ['a', 'b', 'c', 'd', 'e', 'f', 'g'],
    };
    final entries = groupedTrips.entries.toList();
    return LayoutBuilder(
      builder: (context, constraints) {
        final double totalWidth = constraints.maxWidth;
        const double routeWidth = 180;
        final double timeWidth = (totalWidth - routeWidth) / timeSlots.length;
        return Column(
          children: [
            Row(
              children: [
                Container(
                  width: routeWidth,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                ),

                ...timeSlots.map(
                  (time) => Container(
                    width: timeWidth,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      time,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  final tmp = entries[index];
                  final name = tmp.key;
                  final trips = tmp.value;
                  return Row(
                    children: [
                      Container(
                        width: routeWidth,
                        height: 115,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add_circle,
                              color: Colors.green,
                              size: 16,
                            ),

                            const SizedBox(width: 10),

                            Text(
                              name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ...List.generate(timeSlots.length, (tIndex) {
                        final tripInfo = trips[tIndex];
                        return Container(
                          width: timeWidth,
                          height: 115,
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.add_circle,
                                color: Colors.green,
                                size: 15,
                              ),

                              const SizedBox(height: 4),

                              Row(
                                children: [
                                  const Icon(Icons.more_vert, size: 18),

                                  Expanded(
                                    child: Container(
                                      height: 66,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 7,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            tripInfo,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),

                                          const SizedBox(height: 4),

                                          const Text(
                                            '6/10',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quản lý chuyến')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _buildSearch(),
            const SizedBox(height: 30),
            Expanded(child: _buildResult()),
          ],
        ),
      ),
    );
  }
}
