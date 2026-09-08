import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';
import 'payment_method_screen.dart';

class PriceNegotiationScreen extends StatefulWidget {
  const PriceNegotiationScreen({super.key});
  @override
  State<PriceNegotiationScreen> createState() => _PriceNegotiationScreenState();
}

class _PriceNegotiationScreenState extends State<PriceNegotiationScreen> {
  final int suggestedPrice = 800;
  int myPrice = 700;
  final int step = 50;

  void increment() => setState(() => myPrice += step);
  void decrement() { if (myPrice > step) setState(() => myPrice -= step); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
              child: Row(
                children: [
                  IconButton(onPressed: () => Navigator.maybePop(context), icon: const Icon(Icons.arrow_back)),
                  const Spacer(),
                  const VoraLogo(size: 32),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFEDEEEA),
                child: const Center(child: Icon(Icons.route_outlined, size: 64, color: Color(0xFFC7CCC8))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: const BoxDecoration(color: AppColors.dark, borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg))),
              child: Column(
                children: [
                  const Text('Choisissez le prix de votre course', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: AppSpacing.md),
                  Text('Prix conseillé : $suggestedPrice XAF', style: const TextStyle(color: AppColors.green)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: decrement, icon: const Icon(Icons.remove, color: Colors.white)),
                      Text('$myPrice XAF', style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      IconButton(onPressed: increment, icon: const Icon(Icons.add, color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentMethodScreen()));
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, padding: const EdgeInsets.symmetric(vertical: 16)),
                      child: const Text('Réserver (Paiement Séquestre MoMo)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
