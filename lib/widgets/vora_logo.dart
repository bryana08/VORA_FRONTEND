import 'package:flutter/material.dart';

// Logo VORA — image officielle
class VoraLogo extends StatelessWidget {
  final double size;

  const VoraLogo({super.key, this.size = 60});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/vora_logo_icon.png',
      width: size,
      height: size,
    );
  }
}
