import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';
import 'ride_in_progress_screen.dart';
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
  void decrement() {
    if (myPrice > step) setState(() => myPrice -= step);
  }

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
                  const Icon(Icons.menu, color: AppColors.navy),
                  const Spacer(),
                  const VoraLogo(size: 32),
                  const Spacer(),
                  Stack(
                    children: [
                      const Icon(Icons.notifications_none, color: AppColors.navy),
                      Positioned(
                        right: 0, top: 0,
                        child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)],
                ),
                child: Row(
                  children: const [
                    Icon(Icons.water_drop_outlined, color: Colors.blueGrey, size: 18),
                    SizedBox(width: 8),
                    Expanded(child: Text('Pluie - Zone à forte demande', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.navy))),
                    Icon(Icons.bar_chart, color: AppColors.green, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Carte (placeholder avec trajet)
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFEDEEEA),
                child: const Center(child: Icon(Icons.route_outlined, size: 64, color: Color(0xFFC7CCC8))),
              ),
            ),

            // Panneau sombre de négociation
            Container(
              padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.lg),
              decoration: const BoxDecoration(
                color: AppColors.dark,
                borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
              ),
              child: Column(
                children: [
                  Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: AppSpacing.md),
                  const Text('Choisissez le prix de votre course',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('Définissez un prix juste et négociez en toute transparence.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.muted, fontSize: 12.5)),
                  const SizedBox(height: AppSpacing.lg),

                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white24),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Prix conseillé VORA', style: TextStyle(color: Colors.white70, fontSize: 12)),
                                Text('$suggestedPrice XAF',
                                    style: const TextStyle(color: AppColors.green, fontSize: 24, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.greenLight,
                                borderRadius: BorderRadius.circular(AppRadius.pill),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.shield, color: AppColors.green, size: 12),
                                  SizedBox(width: 4),
                                  Text('Prix juste', style: TextStyle(color: AppColors.greenDark, fontSize: 11, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                          child: Divider(color: Colors.white24, height: 1),
                        ),
                        const Text('Votre prix', style: TextStyle(color: Colors.white70, fontSize: 12)),
                        const SizedBox(height: AppSpacing.sm),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _RoundIconButton(icon: Icons.remove, onTap: decrement),
                            Text('$myPrice XAF',
                                style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                            _RoundIconButton(icon: Icons.add, onTap: increment),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentMethodScreen()));
                        // puis naviguer vers PaymentMethodScreen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lock_outline, color: Colors.white, size: 18),
                          SizedBox(width: 8),
                          Text('Réserver (Paiement Séquestre MoMo)',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Row(
                        children: [
                          Icon(Icons.shield, color: AppColors.green, size: 14),
                          SizedBox(width: 4),
                          Text('Paiement 100% sécurisé', style: TextStyle(color: Colors.white70, fontSize: 11)),
                        ],
                      ),
                      Text('Comment ça marche ?', style: TextStyle(color: AppColors.green, fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
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

class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _RoundIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 44, height: 44,
        decoration: const BoxDecoration(color: Color(0xFF1E2624), shape: BoxShape.circle),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
