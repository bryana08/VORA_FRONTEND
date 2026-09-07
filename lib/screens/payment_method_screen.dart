import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';

enum PaymentMethod { momo, orangeMoney, cash }

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  PaymentMethod selected = PaymentMethod.momo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.maybePop(context),
                    icon: const Icon(Icons.arrow_back, color: AppColors.navy),
                  ),
                  const Spacer(),
                  const VoraLogo(size: 32),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: AppSpacing.md),

              const Text('Choisissez votre mode de paiement',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.navy)),
              const SizedBox(height: 4),
              const Text('Votre paiement est sécurisé avec le séquestre VORA.',
                  style: TextStyle(fontSize: 13, color: AppColors.muted)),
              const SizedBox(height: AppSpacing.lg),

              // Bandeau séquestre
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.greenLight,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.lock, color: AppColors.green, size: 20),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Séquestre VORA',
                              style: TextStyle(color: AppColors.greenDark, fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(height: 2),
                          Text(
                            "Le montant est verrouillé et ne sera libéré qu'à la fin de la course, après votre confirmation avec le code ticket.",
                            style: TextStyle(color: AppColors.greenDark, fontSize: 12, height: 1.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              _PaymentOption(
                label: 'MTN MoMo',
                badge: 'Recommandé',
                description: 'Rapide, sécurisé et largement disponible.',
                selected: selected == PaymentMethod.momo,
                color: const Color(0xFFFFCC00),
                onTap: () => setState(() => selected = PaymentMethod.momo),
              ),
              const SizedBox(height: AppSpacing.sm),
              _PaymentOption(
                label: 'Orange Money',
                description: 'Simple et sécurisé.',
                selected: selected == PaymentMethod.orangeMoney,
                color: const Color(0xFFFF7900),
                onTap: () => setState(() => selected = PaymentMethod.orangeMoney),
              ),
              const SizedBox(height: AppSpacing.sm),
              _PaymentOption(
                label: 'Espèces',
                description: "Payez directement au chauffeur à l'arrivée.",
                selected: selected == PaymentMethod.cash,
                color: AppColors.green,
                onTap: () => setState(() => selected = PaymentMethod.cash),
              ),
              const SizedBox(height: AppSpacing.lg),

              const Text('Comment ça marche ?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.navy)),
              const SizedBox(height: AppSpacing.sm),
              _StepRow(number: 1, text: 'Choisissez votre mode de paiement.'),
              _StepRow(number: 2, text: 'Confirmez la réservation.'),
              _StepRow(number: 3, text: 'Entrez votre code MoMo / Orange Money.'),
              _StepRow(number: 4, text: 'Le montant est séquestré.'),
              _StepRow(number: 5, text: 'À l\'arrivée, donnez le code ticket au chauffeur pour débloquer son paiement.'),

              const SizedBox(height: AppSpacing.lg),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: appeler payment_service -> initier le paiement séquestre
                    // puis naviguer vers RideInProgressScreen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
                  ),
                  child: const Text('Continuer',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.lock_outline, size: 14, color: AppColors.muted),
                  SizedBox(width: 4),
                  Text('Paiement 100% sécurisé avec VORA', style: TextStyle(fontSize: 11, color: AppColors.muted)),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymentOption extends StatelessWidget {
  final String label;
  final String? badge;
  final String description;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  const _PaymentOption({
    required this.label,
    this.badge,
    required this.description,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: selected ? AppColors.green : AppColors.border, width: selected ? 1.5 : 1),
        ),
        child: Row(
          children: [
            Container(
              width: 40, height: 40,
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                      if (badge != null) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.pill)),
                          child: Text(badge!, style: const TextStyle(color: AppColors.greenDark, fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ],
                  ),
                  Text(description, style: const TextStyle(fontSize: 12, color: AppColors.muted)),
                ],
              ),
            ),
            Icon(selected ? Icons.check_circle : Icons.circle_outlined, color: selected ? AppColors.green : AppColors.border),
          ],
        ),
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  final int number;
  final String text;
  const _StepRow({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20, height: 20,
            decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
            child: Center(child: Text('$number', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 12.5, color: AppColors.navy))),
        ],
      ),
    );
  }
}
