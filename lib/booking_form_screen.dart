import 'package:flutter/material.dart';
import 'package:flutter_application_1/date_text_field.dart';
import 'package:flutter_application_1/text_field_decoration.dart';
import 'package:flutter_application_1/time_text_field.dart';

class BookingFormScreen extends StatefulWidget {
  const BookingFormScreen({super.key});

  @override
  State<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  String? hinhThucThanhToan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: const Color(0xff2f80b9),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: const Text(
                '15:00 (13:00)  •  26/09/2026  •  Quảng Ninh - Hà Nội (QNHN)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 12,
                          ),
                          child: Text(
                            'Thông tin chung',
                            style: TextStyle(color: Colors.blue, fontSize: 13),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 12,
                          ),
                          child: Text(
                            'Thông tin chung',
                            style: TextStyle(color: Colors.blue, fontSize: 13),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 12,
                          ),
                          child: Text(
                            'Thông tin chung',
                            style: TextStyle(color: Colors.blue, fontSize: 13),
                          ),
                        ),
                      ],
                    ),

                    const Divider(),

                    Wrap(
                      spacing: 5,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          'KVCP',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '13:00',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('→'),

                        Text(
                          'VPQN',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '14:00',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('→'),
                        Text(
                          'CAOTOC',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '16:15',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('→'),
                        Text(
                          'HA NOI',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '17:15',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'KVCP',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '13:00',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('→'),

                        Text(
                          'VPQN',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '14:00',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildLeftForm()),

                        const SizedBox(width: 45),

                        Expanded(child: _buildRightForm()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftForm() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 35,
                child: TimeTextField(labelText: "Giờ"),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 35,
                child: DateTextField(labelText: "Ngày"),
              ),
            ),
          ],
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 35,
          child: TextFormField(
            style: TextStyle(fontSize: 11),
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "SĐT người đặt",
            ),
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 35,
          child: TextFormField(
            style: TextStyle(fontSize: 11),
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "Đón",
            ),
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 35,
          child: TextFormField(
            style: TextStyle(fontSize: 11),
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "Trả",
            ),
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 35,
          child: TextFormField(
            style: TextStyle(fontSize: 11),
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "Giá vé",
              suffixIcon: const Icon(Icons.money_rounded),
            ),
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 35,
          child: TextFormField(
            style: TextStyle(fontSize: 11),
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "Tổng tiền",
            ),
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 35,
          child: DropdownButtonFormField<String>(
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "Hình thức thanh toán",
            ),
            items: const [
              DropdownMenuItem(
                value: 'Tiền mặt',
                child: Text('Tiền mặt', style: TextStyle(fontSize: 12)),
              ),
              DropdownMenuItem(
                value: 'Chuyển khoản',
                child: Text('Chuyển khoản', style: TextStyle(fontSize: 12)),
              ),
            ],
            onChanged: (String? value) {
              setState(() {
                hinhThucThanhToan = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRightForm() {
    return Column(children: [_field(label: 'Tên người đặt')]);
  }

  Widget _field({required String label}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 125,
            child: Text(
              label,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 13),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.zero),
              ),
            ),
          ),
        ],
      ),
    );
  }
  //
}
