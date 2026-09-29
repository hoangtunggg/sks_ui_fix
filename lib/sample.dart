import 'package:flutter/material.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text('Lịch sử', style: TextStyle(fontSize: 16)),
      ),

      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1.2),
                    1: FlexColumnWidth(1.4),
                    2: FlexColumnWidth(1.6),
                    3: FlexColumnWidth(4.4),
                  },

                  border: TableBorder(
                    horizontalInside: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),

                  children: [
                    TableRow(
                      children: [
                        _header('NV'),
                        _header('Tác vụ'),
                        _header('Ngày'),
                        _header('Cập nhật'),
                      ],
                    ),

                    TableRow(
                      children: [
                        _cell('nplongqn.halan'),
                        _cell('Cập nhật'),
                        _cell('14:19:49 -\n26.09.2026'),
                        _cell(
                          'Giờ đón: 15:00 26-09-2026\n'
                          'Mã vé: BK1B9L\n'
                          'T/C Trả: lương thế vinh - nguyễn trãi',
                        ),
                      ],
                    ),

                    TableRow(
                      children: [
                        _cell('bqvietqn.halan'),
                        _cell('ĐHX T.Chuyển\nĐón'),
                        _cell('14:10:06 -\n26.09.2026'),
                        _cell('Trạng thái: Đã hoàn thành'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ================= NÚT ĐÓNG =================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Đóng'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _cell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: Text(text, style: const TextStyle(fontSize: 14, height: 1.4)),
    );
  }
}
