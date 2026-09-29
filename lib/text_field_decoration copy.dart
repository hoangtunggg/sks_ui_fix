// import 'package:flutter/material.dart';

// class BookingFormScreen extends StatefulWidget {
//   const BookingFormScreen({super.key});

//   @override
//   State<BookingFormScreen> createState() => _BookingFormScreenState();
// }

// class _BookingFormScreenState extends State<BookingFormScreen> {
//   bool trungChuyenDon = true;
//   bool trungChuyenTra = true;

//   bool guiTinNhan = false;
//   bool guiZalo = false;
//   bool xuatChungTu = false;

//   String? hinhThucThanhToan;
//   String? maGiamGia;
//   String? daiLy;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildTopBar(),

//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.fromLTRB(16, 12, 16, 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildSeatInfo(),

//                     const SizedBox(height: 12),

//                     _buildTabs(),

//                     const Divider(),

//                     _buildRoute(),

//                     const SizedBox(height: 20),

//                     _buildBookingForm(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),

//       bottomNavigationBar: _buildBottomActions(),
//     );
//   }

//   // ================= HEADER =================

//   Widget _buildTopBar() {
//     return Container(
//       width: double.infinity,
//       color: const Color(0xff2f80b9),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       child: const Text(
//         '15:00 (13:00)  •  26/09/2026  •  Quảng Ninh - Hà Nội (QNHN)',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 13,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }

//   // ================= GHẾ =================

//   Widget _buildSeatInfo() {
//     return Row(
//       children: [
//         const Text('Đang chọn 1 ghế', style: TextStyle(fontSize: 13)),
//         const SizedBox(width: 10),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           color: Colors.grey.shade200,
//           child: const Text(
//             'G3',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     );
//   }

//   // ================= TAB =================

//   Widget _buildTabs() {
//     return Row(
//       children: [
//         _tab(title: 'Thông tin chung', active: true),
//         _tab(title: 'Lịch sử'),
//         _tab(title: 'Lịch sử mới'),
//       ],
//     );
//   }

//   Widget _tab({required String title, bool active = false}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//       decoration: BoxDecoration(
//         border: active
//             ? const Border(
//                 top: BorderSide(color: Colors.grey, width: 2),
//                 left: BorderSide(color: Colors.grey),
//                 right: BorderSide(color: Colors.grey),
//               )
//             : null,
//       ),
//       child: Text(
//         title,
//         style: TextStyle(
//           color: active ? Colors.grey.shade700 : Colors.blue,
//           fontSize: 13,
//         ),
//       ),
//     );
//   }

//   // ================= TUYẾN ĐƯỜNG =================

//   Widget _buildRoute() {
//     return Wrap(
//       spacing: 5,
//       runSpacing: 6,
//       crossAxisAlignment: WrapCrossAlignment.center,
//       children: [
//         _routeText('KVCP', bold: true),
//         _time('13:00'),
//         const Text('→'),

//         _routeText('VPQN'),
//         _time('14:00'),
//         const Text('→'),

//         _routeText('CAOTOC'),
//         _time('15:00'),
//         const Text('→'),

//         _routeText('VPHN'),
//         _time('16:15'),
//         const Text('→'),

//         _routeText('206COLINH'),
//         _time('16:20'),
//         const Text('→'),

//         _routeText('TIMECITY'),
//         _time('16:30'),
//         const Text('→'),

//         _routeText('TTC'),
//         _time('16:40'),
//         const Text('→'),

//         _routeText('286NGTRAI, Hà Nội'),
//         _time('16:50'),
//         const Text('→'),

//         _routeText('CAFELANG'),
//         _time('17:00'),
//         const Text('→'),

//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//           decoration: BoxDecoration(
//             color: Colors.green.shade100,
//             border: Border.all(color: Colors.green),
//           ),
//           child: const Text(
//             'TRUNGKINH, Hà Nội',
//             style: TextStyle(fontSize: 12),
//           ),
//         ),

//         _time('17:10'),
//         const Text('→'),

//         _routeText('SANHES'),
//         _time('18:10'),
//       ],
//     );
//   }

//   Widget _routeText(String value, {bool bold = false}) {
//     return Text(
//       value,
//       style: TextStyle(
//         fontSize: 12,
//         fontWeight: bold ? FontWeight.bold : FontWeight.normal,
//       ),
//     );
//   }

//   Widget _time(String value) {
//     return Text(
//       value,
//       style: const TextStyle(
//         fontSize: 12,
//         color: Colors.blue,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }

//   // ================= FORM =================

//   Widget _buildBookingForm() {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final bool desktop = constraints.maxWidth >= 750;

//         if (desktop) {
//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(child: _buildLeftForm()),

//               const SizedBox(width: 45),

//               Expanded(child: _buildRightForm()),
//             ],
//           );
//         }

//         return Column(
//           children: [
//             _buildLeftForm(),
//             const SizedBox(height: 20),
//             _buildRightForm(),
//           ],
//         );
//       },
//     );
//   }

//   // ================= CỘT TRÁI =================

//   Widget _buildLeftForm() {
//     return Column(
//       children: [
//         _field(
//           label: 'Giờ',
//           required: true,
//           child: Row(
//             children: [
//               SizedBox(width: 80, child: _textField(initialValue: '15:00')),

//               const SizedBox(width: 5),

//               Expanded(
//                 child: _textField(
//                   initialValue: '26-09-2026',
//                   suffixIcon: Icons.keyboard_arrow_down,
//                 ),
//               ),
//             ],
//           ),
//         ),

//         _field(label: 'SĐT người đặt', child: _textField()),

//         _field(
//           label: 'Di động',
//           child: _textField(
//             initialValue: '0983327886',
//             textColor: Colors.lightBlue,
//             suffixIcon: Icons.flag,
//             prefixIcon: Icons.phone,
//           ),
//         ),

//         _switchField(
//           text: 'Trung chuyển',
//           value: trungChuyenDon,
//           onChanged: (value) {
//             setState(() {
//               trungChuyenDon = value;
//             });
//           },
//         ),

//         _field(
//           label: 'Đón',
//           child: _textField(initialValue: 'CHỢ NÚI XẺ CAO THẮNG'),
//         ),

//         _switchField(
//           text: 'Trung chuyển',
//           value: trungChuyenTra,
//           onChanged: (value) {
//             setState(() {
//               trungChuyenTra = value;
//             });
//           },
//         ),

//         _field(
//           label: 'Trả',
//           child: _textField(initialValue: 'Lương Thế Vinh - Nguyễn Trãi'),
//         ),

//         _field(
//           label: 'Giá vé',
//           child: _moneyField(value: '320.000'),
//         ),

//         _field(
//           label: 'Coupon',
//           child: _moneyField(value: '0', enabled: false),
//         ),

//         _field(
//           label: 'Mã giảm giá',
//           child: _dropdown(
//             value: maGiamGia,
//             hint: 'Chọn mã giảm giá',
//             items: const ['KM10', 'KM20', 'KM30'],
//             onChanged: (value) {
//               setState(() {
//                 maGiamGia = value;
//               });
//             },
//           ),
//         ),

//         const SizedBox(height: 30),

//         _field(
//           label: 'Tổng tiền',
//           child: _moneyField(value: '320.000', enabled: false),
//         ),

//         _field(
//           label: 'HTTT',
//           child: _dropdown(
//             value: hinhThucThanhToan,
//             hint: '---- Chọn hình thức ----',
//             items: const ['Tiền mặt', 'Chuyển khoản', 'QR'],
//             onChanged: (value) {
//               setState(() {
//                 hinhThucThanhToan = value;
//               });
//             },
//           ),
//         ),

//         const SizedBox(height: 25),

//         _field(
//           label: 'Ghi chú',
//           child: TextFormField(
//             minLines: 3,
//             maxLines: 4,
//             decoration: _inputDecoration(),
//           ),
//         ),

//         _field(
//           label: 'Tiền phụ thu TC đón',
//           child: _moneyField(value: '0'),
//         ),

//         _checkbox(
//           title: 'Gửi tin nhắn',
//           value: guiTinNhan,
//           onChanged: (value) {
//             setState(() {
//               guiTinNhan = value ?? false;
//             });
//           },
//         ),

//         _checkbox(
//           title: 'Gửi tin nhắn Zalo',
//           value: guiZalo,
//           onChanged: (value) {
//             setState(() {
//               guiZalo = value ?? false;
//             });
//           },
//         ),

//         _checkbox(
//           title: 'Yêu cầu xuất chứng từ',
//           value: xuatChungTu,
//           bold: true,
//           onChanged: (value) {
//             setState(() {
//               xuatChungTu = value ?? false;
//             });
//           },
//         ),
//       ],
//     );
//   }

//   // ================= CỘT PHẢI =================

//   Widget _buildRightForm() {
//     return Column(
//       children: [
//         _field(label: 'Tên người đặt', child: _textField()),

//         _field(
//           label: 'Tên Người đi',
//           child: _textField(
//             initialValue: 'VŨ DUY HOÀNG',
//             textColor: Colors.lightBlue,
//           ),
//         ),

//         _field(
//           label: 'Khu vực',
//           child: _dropdown(
//             hint: 'VP 95 Cao Thắng',
//             items: const ['VP 95 Cao Thắng', 'Quảng Ninh', 'Hà Nội'],
//           ),
//         ),

//         const SizedBox(height: 38),

//         _field(
//           label: 'Khu vực',
//           child: _dropdown(
//             hint: 'Tân Đại Nghĩa',
//             items: const ['Tân Đại Nghĩa', 'Thanh Xuân', 'Cầu Giấy'],
//           ),
//         ),

//         _field(
//           label: 'Phụ thu',
//           child: _moneyField(value: '0'),
//         ),

//         const SizedBox(height: 28),

//         _field(
//           label: 'Giảm giá',
//           child: _moneyField(value: '0'),
//         ),

//         _field(
//           label: 'Chọn đại lý',
//           child: _dropdown(
//             value: daiLy,
//             hint: 'Chọn đại lý',
//             items: const ['Đại lý 1', 'Đại lý 2', 'Đại lý 3'],
//             onChanged: (value) {
//               setState(() {
//                 daiLy = value;
//               });
//             },
//           ),
//         ),

//         const SizedBox(height: 100),

//         _field(
//           label: 'Mã vé',
//           child: _textField(
//             initialValue: 'BK1B9L',
//             textColor: Colors.lightBlue,
//             enabled: false,
//           ),
//         ),

//         _field(
//           label: 'Tiền phụ thu TC trả',
//           child: _moneyField(value: '0'),
//         ),
//       ],
//     );
//   }

//   // ================= FIELD CHUNG =================

//   Widget _field({
//     required String label,
//     required Widget child,
//     bool required = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             width: 125,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 if (required)
//                   const Text('* ', style: TextStyle(color: Colors.red)),

//                 Flexible(
//                   child: Text(
//                     label,
//                     textAlign: TextAlign.right,
//                     style: const TextStyle(fontSize: 13),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(width: 12),

//           Expanded(child: child),
//         ],
//       ),
//     );
//   }

//   // ================= TEXT FIELD =================

//   Widget _textField({
//     String? initialValue,
//     Color? textColor,
//     IconData? prefixIcon,
//     IconData? suffixIcon,
//     bool enabled = true,
//   }) {
//     return TextFormField(
//       initialValue: initialValue,
//       enabled: enabled,
//       style: TextStyle(
//         fontSize: 13,
//         color: textColor,
//         fontWeight: textColor != null ? FontWeight.w600 : FontWeight.normal,
//       ),
//       decoration: _inputDecoration(
//         prefixIcon: prefixIcon,
//         suffixIcon: suffixIcon,
//       ),
//     );
//   }

//   // ================= MONEY =================

//   Widget _moneyField({required String value, bool enabled = true}) {
//     return TextFormField(
//       initialValue: value,
//       enabled: enabled,
//       style: const TextStyle(
//         color: Colors.lightBlue,
//         fontWeight: FontWeight.bold,
//         fontSize: 14,
//       ),
//       decoration: _inputDecoration(suffix: 'đ'),
//     );
//   }

//   // ================= DROPDOWN =================

//   Widget _dropdown({
//     String? value,
//     required String hint,
//     required List<String> items,
//     ValueChanged<String?>? onChanged,
//   }) {
//     return DropdownButtonFormField<String>(
//       value: value,
//       isExpanded: true,
//       decoration: _inputDecoration(),
//       hint: Text(hint, style: const TextStyle(fontSize: 13)),
//       items: items
//           .map(
//             (item) => DropdownMenuItem(
//               value: item,
//               child: Text(item, style: const TextStyle(fontSize: 13)),
//             ),
//           )
//           .toList(),
//       onChanged: onChanged ?? (_) {},
//     );
//   }

//   // ================= SWITCH =================

//   Widget _switchField({
//     required String text,
//     required bool value,
//     required ValueChanged<bool> onChanged,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 135, bottom: 8),
//       child: Row(
//         children: [
//           Switch(
//             value: value,
//             onChanged: onChanged,
//             materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//           ),

//           Text(text, style: const TextStyle(fontSize: 12, color: Colors.grey)),
//         ],
//       ),
//     );
//   }

//   // ================= CHECKBOX =================

//   Widget _checkbox({
//     required String title,
//     required bool value,
//     required ValueChanged<bool?> onChanged,
//     bool bold = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 125),
//       child: CheckboxListTile(
//         contentPadding: EdgeInsets.zero,
//         dense: true,
//         controlAffinity: ListTileControlAffinity.leading,
//         value: value,
//         onChanged: onChanged,
//         title: Row(
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 13,
//                 fontWeight: bold ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),

//             if (!bold) ...[
//               const SizedBox(width: 5),
//               const Icon(Icons.edit, size: 15, color: Colors.blue),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   // ================= DECORATION =================

//   InputDecoration _inputDecoration({
//     IconData? prefixIcon,
//     IconData? suffixIcon,
//     String? suffix,
//   }) {
//     return InputDecoration(
//       isDense: true,
//       filled: false,

//       prefixIcon: prefixIcon == null ? null : Icon(prefixIcon, size: 16),

//       suffixIcon: suffixIcon == null ? null : Icon(suffixIcon, size: 16),

//       suffixText: suffix,

//       contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.zero,
//         borderSide: BorderSide(color: Colors.grey.shade300),
//       ),

//       focusedBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.zero,
//         borderSide: BorderSide(color: Colors.blue),
//       ),

//       disabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.zero,
//         borderSide: BorderSide(color: Colors.grey.shade300),
//       ),
//     );
//   }

//   // ================= BOTTOM BUTTON =================

//   Widget _buildBottomActions() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border(top: BorderSide(color: Colors.grey.shade300)),
//       ),
//       child: Wrap(
//         alignment: WrapAlignment.spaceBetween,
//         runSpacing: 8,
//         spacing: 8,
//         children: [
//           Wrap(
//             spacing: 6,
//             children: [
//               _button('✖ Hủy vé', Colors.red.shade600),
//               _button('Thêm vé', Colors.green),
//               _button('Khứ hồi', Colors.blue.shade700),
//             ],
//           ),

//           Wrap(
//             spacing: 6,
//             children: [
//               _button(
//                 'QR thanh toán',
//                 Colors.blue.shade100,
//                 textColor: Colors.blue.shade700,
//               ),

//               _button('Xuất vé điện tử', Colors.lightBlue.shade300),

//               _button('Cập nhật', Colors.blue.shade700),

//               _button('In vé', Colors.orange),

//               _button(
//                 'Đóng',
//                 Colors.grey.shade200,
//                 textColor: Colors.grey.shade700,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _button(
//     String title,
//     Color backgroundColor, {
//     Color textColor = Colors.white,
//   }) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: backgroundColor,
//         foregroundColor: textColor,
//         elevation: 0,
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//       ),
//       onPressed: () {},
//       child: Text(
//         title,
//         style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
//       ),
//     );
//   }
// }

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
            // ================= HEADER =================
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

            // ================= BODY =================
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ================= TAB =================
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: const Text(
                            'Thông tin chung',
                            style: TextStyle(color: Colors.blue, fontSize: 13),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: const Text(
                            'Lịch sử',
                            style: TextStyle(color: Colors.blue, fontSize: 13),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: const Text(
                            'Lịch sử mới',
                            style: TextStyle(color: Colors.blue, fontSize: 13),
                          ),
                        ),
                      ],
                    ),

                    const Divider(),

                    // ================= TUYẾN ĐƯỜNG =================
                    Wrap(
                      spacing: 5,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: const [
                        Text(
                          'KVCP',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '13:00',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('→'),

                        Text(
                          'VPQN',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '14:00',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('→'),

                        Text(
                          'CAOTOC',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '16:15',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('→'),

                        Text(
                          'HA NOI',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '17:15',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // ================= FORM 2 CỘT =================
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1100),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildLeftForm()),

                            const SizedBox(width: 30),

                            Expanded(child: _buildRightForm()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: _buildBottomActions(),
    );
  }

  // =========================================================
  // LEFT FORM
  // =========================================================

  Widget _buildLeftForm() {
    return Column(
      children: [
        // ================= GIỜ + NGÀY =================
        Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 35,
                child: TimeTextField(labelText: "Giờ"),
              ),
            ),

            const SizedBox(width: 8),

            Expanded(
              flex: 5,
              child: SizedBox(
                height: 35,
                child: DateTextField(labelText: "Ngày"),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // ================= SĐT NGƯỜI ĐẶT =================
        SizedBox(
          height: 35,
          child: TextFormField(
            style: const TextStyle(fontSize: 11),
            decoration: TextFieldDecoration.standard(
              contentPadding: const EdgeInsets.all(10),
              labelText: "SĐT người đặt",
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ================= ĐÓN =================
        SizedBox(
          height: 35,
          child: TextFormField(
            style: const TextStyle(fontSize: 11),
            decoration: TextFieldDecoration.standard(
              contentPadding: const EdgeInsets.all(10),
              labelText: "Đón",
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ================= TRẢ =================
        SizedBox(
          height: 35,
          child: TextFormField(
            style: const TextStyle(fontSize: 11),
            decoration: TextFieldDecoration.standard(
              contentPadding: const EdgeInsets.all(10),
              labelText: "Trả",
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ================= GIÁ VÉ =================
        SizedBox(
          height: 35,
          child: TextFormField(
            style: const TextStyle(
              fontSize: 11,
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
            ),
            decoration: TextFieldDecoration.standard(
              contentPadding: const EdgeInsets.all(10),
              labelText: "Giá vé",
            ).copyWith(suffixText: 'đ'),
          ),
        ),

        const SizedBox(height: 10),

        // ================= PHỤ THU TC ĐÓN =================
        SizedBox(
          height: 35,
          child: TextFormField(
            style: const TextStyle(fontSize: 11),
            decoration: TextFieldDecoration.standard(
              contentPadding: const EdgeInsets.all(10),
              labelText: "Tiền phụ thu TC đón",
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ================= TỔNG TIỀN =================
        SizedBox(
          height: 35,
          child: TextFormField(
            style: const TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
            decoration: TextFieldDecoration.standard(
              contentPadding: const EdgeInsets.all(10),
              labelText: "Tổng tiền",
            ).copyWith(suffixText: 'đ'),
          ),
        ),

        const SizedBox(height: 10),

        // ================= HTTT =================
        SizedBox(
          height: 35,
          child: DropdownButtonFormField<String>(
            decoration: TextFieldDecoration.standard(
              contentPadding: const EdgeInsets.all(10),
              labelText: "Hình thức thanh toán",
            ),

            style: const TextStyle(fontSize: 12, color: Colors.black87),

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

        const SizedBox(height: 8),

        // ================= CHECKBOX =================
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: guiTinNhan,

          dense: true,

          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),

          contentPadding: EdgeInsets.zero,

          onChanged: (value) {
            setState(() {
              guiTinNhan = value ?? false;
            });
          },

          title: const Row(
            children: [
              Text('Gửi tin nhắn', style: TextStyle(fontSize: 12)),
              SizedBox(width: 5),
              Icon(Icons.edit, size: 14, color: Colors.blue),
            ],
          ),
        ),

        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: guiZalo,

          dense: true,

          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),

          contentPadding: EdgeInsets.zero,

          onChanged: (value) {
            setState(() {
              guiZalo = value ?? false;
            });
          },

          title: const Row(
            children: [
              Text('Gửi tin nhắn Zalo', style: TextStyle(fontSize: 12)),
              SizedBox(width: 5),
              Icon(Icons.edit, size: 14, color: Colors.blue),
            ],
          ),
        ),

        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: xuatChungTu,

          dense: true,

          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),

          contentPadding: EdgeInsets.zero,

          onChanged: (value) {
            setState(() {
              xuatChungTu = value ?? false;
            });
          },

          title: const Text(
            'Yêu cầu xuất chứng từ',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  // =========================================================
  // RIGHT FORM
  // =========================================================

  Widget _buildRightForm() {
    return Column(
      children: [
        // ================= TÊN NGƯỜI ĐẶT =================
        SizedBox(
          height: 35,
          child: TextFormField(
            style: const TextStyle(fontSize: 11),
            decoration: TextFieldDecoration.standard(
              contentPadding: const EdgeInsets.all(10),
              labelText: "Tên người đặt",
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ================= TÊN NGƯỜI ĐI =================
        SizedBox(
          height: 35,
          child: TextFormField(
            style: const TextStyle(fontSize: 11),
            decoration: TextFieldDecoration.standard(
              contentPadding: const EdgeInsets.all(10),
              labelText: "Tên người đi",
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ================= KHU VỰC 1 =================
        SizedBox(
          height: 35,
          child: DropdownButtonFormField<String>(
            decoration: TextFieldDecoration.standard(
              contentPadding: const EdgeInsets.all(10),
              labelText: "Khu vực",
            ),
            style: const TextStyle(fontSize: 12, color: Colors.black87),
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
            onChanged: (String? value) {},
          ),
        ),

        const SizedBox(height: 10),

        // ================= KHU VỰC 2 =================
        SizedBox(
          height: 35,
          child: DropdownButtonFormField<String>(
            decoration: TextFieldDecoration.standard(
              contentPadding: const EdgeInsets.all(10),
              labelText: "Khu vực",
            ),
            style: const TextStyle(fontSize: 12, color: Colors.black87),
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
            onChanged: (String? value) {},
          ),
        ),

        const SizedBox(height: 10),

        // ================= PHỤ THU =================
        SizedBox(
          height: 35,
          child: TextFormField(
            style: const TextStyle(fontSize: 11),
            decoration: TextFieldDecoration.standard(
              contentPadding: const EdgeInsets.all(10),
              labelText: "Phụ thu",
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ================= GHI CHÚ =================
        SizedBox(
          height: 80,
          child: TextFormField(
            controller: noteController,

            expands: true,
            maxLines: null,

            textAlignVertical: TextAlignVertical.top,

            style: const TextStyle(fontSize: 11),

            decoration: TextFieldDecoration.standard(
              contentPadding: const EdgeInsets.all(10),
              labelText: "Ghi chú",
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ================= PHỤ THU TC TRẢ =================
        SizedBox(
          height: 35,
          child: TextFormField(
            style: const TextStyle(fontSize: 11),
            decoration: TextFieldDecoration.standard(
              contentPadding: const EdgeInsets.all(10),
              labelText: "Tiền phụ thu TC trả",
            ),
          ),
        ),
      ],
    );
  }

  // =========================================================
  // BOTTOM ACTIONS
  // =========================================================

  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              _actionButton(
                text: '✖ Hủy vé',
                backgroundColor: Colors.red.shade600,
              ),

              _actionButton(text: 'Thêm vé', backgroundColor: Colors.green),

              _actionButton(
                text: 'Khứ hồi',
                backgroundColor: Colors.blue.shade700,
              ),
            ],
          ),

          Wrap(
            spacing: 6,
            children: [
              _actionButton(
                text: 'QR thanh toán',
                backgroundColor: Colors.blue.shade100,
                foregroundColor: Colors.blue.shade700,
              ),

              _actionButton(
                text: 'Xuất vé điện tử',
                backgroundColor: Colors.lightBlue.shade300,
              ),

              _actionButton(
                text: 'Cập nhật',
                backgroundColor: Colors.blue.shade700,
              ),

              _actionButton(text: 'In vé', backgroundColor: Colors.orange),

              _actionButton(
                text: 'Đóng',
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.grey.shade700,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required String text,
    required Color backgroundColor,
    Color foregroundColor = Colors.white,
  }) {
    return ElevatedButton(
      onPressed: () {},

      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 0,

        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      child: Text(
        text,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }
}
