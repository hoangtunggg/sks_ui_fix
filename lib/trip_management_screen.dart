import 'package:flutter/material.dart';

class RouteManagementScreen extends StatefulWidget {
  const RouteManagementScreen({super.key});

  @override
  State<RouteManagementScreen> createState() => _RouteManagementScreenState();
}

class TripItem {
  final String time;
  final String driver;
  final String value;
  final int booked;
  final int total;

  TripItem({
    required this.time,
    required this.driver,
    required this.value,
    required this.booked,
    required this.total,
  });
}

class _RouteManagementScreenState extends State<RouteManagementScreen> {
  Widget _buildResult() {
    final timeSlots = [
      '12:00',
      '12:01',
      '13:00',
      '13:01',
      '14:00',
      '14:01',
      '15:00',
    ];

    final groupedTrips = {
      'QNHN': [
        TripItem(
          time: '12:00',
          driver: 'Cường',
          value: '64.70',
          booked: 6,
          total: 10,
        ),
        TripItem(
          time: '12:01',
          driver: 'Bằng',
          value: '34.57',
          booked: 7,
          total: 10,
        ),
        TripItem(
          time: '13:00',
          driver: 'Tùng',
          value: '34.74',
          booked: 8,
          total: 10,
        ),
        TripItem(
          time: '13:01',
          driver: 'Cường',
          value: '23.23',
          booked: 4,
          total: 10,
        ),
        TripItem(
          time: '14:00',
          driver: 'Hùng',
          value: '34.17',
          booked: 8,
          total: 10,
        ),
        TripItem(
          time: '14:01',
          driver: 'Khôi',
          value: '26.19',
          booked: 5,
          total: 10,
        ),
        TripItem(
          time: '15:00',
          driver: 'Trung',
          value: '34.40',
          booked: 7,
          total: 10,
        ),
      ],
    };

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          _buildHeader(timeSlots),

          ...groupedTrips.entries.map(
            (entry) => _buildRouteRow(entry.key, entry.value, timeSlots),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(List<String> timeSlots) {
    return Row(
      children: [
        // ô trống góc trên bên trái
        Container(
          width: 180,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
          ),
        ),

        ...timeSlots.map(
          (time) => Container(
            width: 185,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(
              time,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRouteRow(
    String routeName,
    List<TripItem> trips,
    List<String> timeSlots,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tên tuyến
        Container(
          width: 180,
          height: 115,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              const Icon(Icons.add_circle, color: Colors.green, size: 16),

              const SizedBox(width: 10),

              Text(
                routeName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        // Các cột giờ
        ...timeSlots.map((time) {
          TripItem? trip;

          for (final item in trips) {
            if (item.time == time) {
              trip = item;
              break;
            }
          }

          return _buildTimeCell(trip);
        }),
      ],
    );
  }

  Widget _buildTimeCell(TripItem? trip) {
    return Container(
      width: 185,
      height: 115,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: trip == null
          ? const SizedBox()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.add_circle, color: Colors.green, size: 15),

                const SizedBox(height: 4),

                Row(
                  children: [
                    const Icon(Icons.more_vert, color: Colors.blue, size: 18),

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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${trip.value} | ${trip.driver} |',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              '${trip.booked}/${trip.total}',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quản lý chuyến')),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Expanded(child: _buildResult()),
          ],
        ),
      ),
    );
  }
}

Widget _buildResult() {
  final timeSlots = ['0', '1', '2', '3', '4', '5', '6'];

  final groupedTrips = {
    'QNHN': ['a', 'b', 'c', 'd', 'e', 'f', 'g'],
    'HNHP': ['a', 'b', 'c', 'd', 'e', 'f', 'g'],
    'HPQN': ['a', 'b', 'c', 'd', 'e', 'f', 'g'],
  };

  final entries = groupedTrips.entries.toList();

  final double tableWidth = 180 + (timeSlots.length * 185);

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: SizedBox(
      width: tableWidth,
      child: Column(
        children: [
          // HEADER
          Row(
            children: [
              Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),

              ...timeSlots.map(
                (time) => Container(
                  width: 185,
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

          // BODY
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];

                final routeName = entry.key;
                final trips = entry.value;

                return Row(
                  children: [
                    // TÊN TUYẾN
                    Container(
                      width: 180,
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
                            routeName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    // CÁC Ô THỜI GIAN
                    ...List.generate(timeSlots.length, (timeIndex) {
                      final trip = trips[timeIndex];

                      return Container(
                        width: 185,
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
                                const Icon(
                                  Icons.more_vert,
                                  color: Colors.blue,
                                  size: 18,
                                ),

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
                                          trip,
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
      ),
    ),
  );
}
