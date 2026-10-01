// import 'dart:typed_data';

// import 'package:file_saver/file_saver.dart';
// import 'package:flutter/material.dart';
// import 'package:pasteboard/pasteboard.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:screenshot/screenshot.dart';
// import 'package:toastification/toastification.dart';

// import '../../../models/bus_model.dart';
// import '../../../utils/global.dart';
// import '../../../utils/string_utils.dart';
// import '../../widgets/gradient_button.dart';
// import '../../widgets/gradient_header.dart';

// class PaymentQrDialog extends StatefulWidget {
//   final PaymentQRResponse payment;
//   final BusCard busCard;
//   final RechargeItem item;
//   const new({
//     super.key,
//     required this.payment,
//     required this.busCard,
//     required this.item,
//   });

//   @override
//   State<PaymentQrDialog> createState() => _PaymentQrDialogState();
// }

// class _PaymentQrDialogState extends State<PaymentQrDialog> {
//   Future<void> copyQrCode() async {
//     final controller = ScreenshotController();
//     Uint8List bytes = await controller.captureFromWidget(
//       shareQrWidget(),
//       context: context,
//       pixelRatio: 2.0,
//       delay: const Duration(milliseconds: 100),
//     );

//     await Pasteboard.writeImage(bytes);
//     showToast("Copy thành công!", ToastificationType.success);
//   }

//   Future<void> downloadQrCode() async {
//     final controller = ScreenshotController();
//     Uint8List bytes = await controller.captureFromWidget(
//       shareQrWidget(),
//       context: context,
//       pixelRatio: 2.0,
//       delay: const Duration(milliseconds: 100),
//     );

//     try {
//       await FileSaver.instance.saveFile(
//         name: "image",
//         bytes: bytes,
//         mimeType: MimeType.jpeg,
//       );
//       showToast("Lưu ảnh thành công!", ToastificationType.success);
//     } catch (e) {
//       return;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: SizedBox(
//         width: 500,
//         height: 620,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: Material(
//             color: Colors.white,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 GradientHeader(title: "QR thanh toán"),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 13,
//                       horizontal: 13,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(child: shareQrWidget()),
//                         SizedBox(height: 10),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             TextButton(
//                               style: TextButton.styleFrom(
//                                 fixedSize: const Size(70, 42),
//                                 backgroundColor: const Color(0xFFF1F3F6),
//                                 foregroundColor: const Color(0xFF374151),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                               ),
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text(
//                                 'Hủy',
//                                 style: TextStyle(
//                                   fontSize: 11,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             GradientButton(
//                               onPressed: copyQrCode,
//                               label: "Copy QR",
//                             ),
//                             const SizedBox(width: 12),
//                             GradientButton(
//                               onPressed: downloadQrCode,
//                               label: "Tải về",
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget shareQrWidget() {
//     return Container(
//       padding: EdgeInsets.all(16),
//       width: 400,
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "QUÉT QR ĐỂ THANH TOÁN",
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             "Họ tên: ${widget.busCard.fullName}",
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//           Text(
//             "Mã thẻ: ${widget.busCard.cardNo}",
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//           SizedBox(height: 8),
//           QrImageView(
//             size: 250,
//             data: widget.payment.content,
//             gapless: false,
//             embeddedImage: Image.asset("assets/images/logo_32x32.png").image,
//             embeddedImageStyle: QrEmbeddedImageStyle(size: Size(32, 32)),
//           ),
//           SizedBox(height: 8),
//           Text(
//             widget.payment.bankAccountName.toUpperCase(),
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//           Text(
//             widget.payment.shortName,
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//           Text(
//             widget.payment.bankAccountNo,
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//           Text(
//             "Số tiền: ${(widget.item.paidAmount * 1000).toInt().formatThousand()}đ",
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
