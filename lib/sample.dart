import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentQrDialog extends StatelessWidget {
  const PaymentQrDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: 800,
        height: 520,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                children: [
                  // ================= HEADER =================
                  Row(
                    children: [
                      const Icon(Icons.lightbulb_outline, size: 32),
                      const SizedBox(width: 15),

                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 13),
                            children: [
                              TextSpan(text: 'Mở App Ngân hàng bất kỳ để '),
                              TextSpan(
                                text: 'quét mã VietQR',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: ' hoặc chuyển khoản chính xác số tiền bên dưới',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // ================= BODY =================
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ================= LEFT =================
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              const Text(
                                'VIETQR PRO',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Container(
                                width: 185,
                                height: 185,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueGrey),
                                ),
                                child: Image.asset(
                                  'assets/images/qr_payment.png',
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(height: 12),

                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'napas 247',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'MB',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              const Spacer(),

                              OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(80, 38),
                                ),
                                child: const Text('Huỷ'),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 40),

                        // ================= RIGHT =================
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Ngân hàng
                              Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'MB',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ngân hàng',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        'Ngân hàng TMCP Quân đội',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              const SizedBox(height: 15),

                              _infoRow(
                                label: 'Chủ tài khoản:',
                                value: 'BUI TIEN LOC',
                              ),

                              const SizedBox(height: 12),

                              _infoRow(
                                label: 'Số tài khoản:',
                                value: 'VQRQAMJSS9604',
                                copyable: true,
                              ),

                              const SizedBox(height: 12),

                              _infoRow(
                                label: 'Số tiền:',
                                value: '2,000 vnd',
                                copyable: true,
                              ),

                              const SizedBox(height: 12),

                              _infoRow(
                                label: 'Nội dung:',
                                value: 'Thanh toán đơn hàng',
                                copyable: true,
                              ),

                              const Spacer(),

                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Lưu ý : Nhập chính xác số tiền ',
                                    ),
                                    TextSpan(
                                      text: '2,000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: ' khi chuyển\nkhoản'),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 25),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ================= CLOSE =================
            Positioned(
              top: 12,
              right: 12,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close, size: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow({
    required String label,
    required String value,
    bool copyable = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),

              const SizedBox(height: 2),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        if (copyable)
          TextButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: value));
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xffedf7f3),
              foregroundColor: Colors.black54,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              minimumSize: Size.zero,
            ),
            child: const Text(
              'Sao chép',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }
}
