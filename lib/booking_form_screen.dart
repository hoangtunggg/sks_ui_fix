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
  bool guiTinNhan = false;
  bool guiZalo = false;
  bool xuatChungTu = false;

  String? hinhThucThanhToan;

  final TextEditingController noteController = TextEditingController();

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
                padding: const EdgeInsets.all(30),
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
                            'Lịch sử',
                            style: TextStyle(color: Colors.blue, fontSize: 13),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 12,
                          ),
                          child: Text(
                            'Lịch sử mới',
                            style: TextStyle(color: Colors.blue, fontSize: 13),
                          ),
                        ),
                      ],
                    ),

                    const Divider(),

                    const SizedBox(height: 30),

                    Wrap(
                      spacing: 5,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          'KVCP',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '13:00',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('→'),

                        Text(
                          'VPQN',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '14:00',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('→'),
                        Text(
                          'CAOTOC',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '16:15',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('→'),
                        Text(
                          'HA NOI',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '17:15',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'KVCP',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '13:00',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('→'),

                        Text(
                          'VPQN',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '14:00',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 45),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildLeft()),

                        const SizedBox(width: 45),

                        Expanded(child: _buildRight()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottom(),
    );
  }

  Widget _buildLeft() {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(flex: 2, child: TimeTextField(labelText: "Giờ")),
              const SizedBox(width: 10),
              Expanded(flex: 5, child: DateTextField(labelText: "Ngày")),
            ],
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 50,
          child: TextFormField(
            style: TextStyle(fontSize: 12),
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "SĐT người đặt",
            ),
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: TextFormField(
                  style: const TextStyle(fontSize: 12),
                  decoration: TextFieldDecoration.standard(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: "Đón",
                  ),
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.zero,
                  title: Text('Trung chuyển'),
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: TextFormField(
                  style: const TextStyle(fontSize: 12),
                  decoration: TextFieldDecoration.standard(
                    contentPadding: const EdgeInsets.all(10),
                    labelText: "Trả",
                  ),
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.zero,
                  title: Text('Trung chuyển'),
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 50,
          child: TextFormField(
            style: TextStyle(
              fontSize: 12,
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
            ),
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "Giá vé",
            ),
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 50,
          child: TextFormField(
            style: TextStyle(fontSize: 12),
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "Tiền phụ thu TC đón",
            ),
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 50,
          child: TextFormField(
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "Tổng tiền",
            ),
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 50,
          child: DropdownButtonFormField<String>(
            hint: Text('Chọn hình thức', style: const TextStyle(fontSize: 12)),
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

        // SizedBox(height: 20),

        // Padding(
        //   padding: const EdgeInsets.only(left: 10),
        //   child: CheckboxListTile(
        //     controlAffinity: ListTileControlAffinity.leading,
        //     value: guiTinNhan,
        //     onChanged: (value) {
        //       setState(() {
        //         guiTinNhan = value ?? false;
        //       });
        //     },
        //     title: Row(
        //       children: [
        //         Text('Gửi tin nhắn', style: TextStyle(fontSize: 15)),
        //         const SizedBox(width: 5),
        //         const Icon(Icons.edit, size: 15, color: Colors.blue),
        //       ],
        //     ),
        //   ),
        // ),

        // Padding(
        //   padding: const EdgeInsets.only(left: 10),
        //   child: CheckboxListTile(
        //     controlAffinity: ListTileControlAffinity.leading,
        //     value: guiZalo,
        //     onChanged: (value) {
        //       setState(() {
        //         guiZalo = value ?? false;
        //       });
        //     },
        //     title: Row(
        //       children: [
        //         Text('Gửi tin nhắn Zalo', style: TextStyle(fontSize: 15)),
        //         const SizedBox(width: 5),
        //         const Icon(Icons.edit, size: 15, color: Colors.blue),
        //       ],
        //     ),
        //   ),
        // ),

        // Padding(
        //   padding: const EdgeInsets.only(left: 10),
        //   child: CheckboxListTile(
        //     controlAffinity: ListTileControlAffinity.leading,
        //     value: xuatChungTu,
        //     onChanged: (value) {
        //       setState(() {
        //         xuatChungTu = value ?? false;
        //       });
        //     },
        //     title: Text(
        //       'Yêu cầu xuất chứng từ',
        //       style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildRight() {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextFormField(
            style: TextStyle(fontSize: 12),
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "Tên người đặt",
            ),
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 50,
          child: TextFormField(
            style: TextStyle(fontSize: 12),
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "Tên người đi",
            ),
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 50,
          child: DropdownButtonFormField<String>(
            hint: Text('Chọn khu vực', style: const TextStyle(fontSize: 12)),
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "Khu vực",
            ),
            items: const [
              DropdownMenuItem(
                value: 'Hà Nội',
                child: Text('Hà Nội', style: TextStyle(fontSize: 12)),
              ),
              DropdownMenuItem(
                value: 'Hải Phòng',
                child: Text('Hải Phòng', style: TextStyle(fontSize: 12)),
              ),
            ],
            onChanged: (String? value) {
              setState(() {
                hinhThucThanhToan = value;
              });
            },
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 50,
          child: DropdownButtonFormField<String>(
            hint: Text('Chọn khu vực', style: const TextStyle(fontSize: 12)),
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "Khu vực",
            ),
            items: const [
              DropdownMenuItem(
                value: 'Cầu giấy',
                child: Text('Cầu giấy', style: TextStyle(fontSize: 12)),
              ),
              DropdownMenuItem(
                value: 'Thanh xuân',
                child: Text('Thanh xuân', style: TextStyle(fontSize: 12)),
              ),
            ],
            onChanged: (String? value) {
              setState(() {
                hinhThucThanhToan = value;
              });
            },
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 50,
          child: TextFormField(
            style: TextStyle(fontSize: 12),
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "Phụ thu",
            ),
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 50,
          child: TextFormField(
            style: TextStyle(fontSize: 12),
            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "Tiền phụ thu TC trả",
            ),
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 115,
          child: TextFormField(
            controller: noteController,

            style: TextStyle(fontSize: 12),
            expands: true,
            maxLines: null,
            textAlignVertical: TextAlignVertical.top,

            decoration: TextFieldDecoration.standard(
              contentPadding: EdgeInsets.all(10),
              labelText: "Ghi chú",
            ),
          ),
        ),

        SizedBox(height: 15),
      ],
    );
  }

  Widget _buildBottom() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 8,
        spacing: 8,
        children: [
          Wrap(
            spacing: 6,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  '✖ Hủy vé',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Thêm vé',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Khứ hồi',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          Wrap(
            spacing: 6,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                  foregroundColor: Colors.blue.shade700,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'QR thanh toán',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue.shade300,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Xuất vé điện tử',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Cập nhật',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'In vé',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  foregroundColor: Colors.grey.shade700,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Đóng',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
