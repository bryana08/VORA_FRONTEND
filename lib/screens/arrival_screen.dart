import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';

class ArrivalScreen extends StatelessWidget {
  // Le vrai code vient de `secret_pin` renvoyé par le backend à la création
  // de la course (voir ride_service.dart) — pas généré côté frontend.
  final String ticketCode;

  const ArrivalScreen({super.key, this.ticketCode = '4821'});

  @override
  Widget build(BuildContext context) {
    final digits = ticketCode.split('');

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
                  const Icon(Icons.more_vert, color: AppColors.navy),
                ],
              ),
              const SizedBox(height: AppSpacing.md),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44, height: 44,
                    decoration: const BoxDecoration(color: AppColors.greenLight, shape: BoxShape.circle),
                    child: const Icon(Icons.check, color: AppColors.green),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Vous êtes arrivé à', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.navy)),
                        Text('Carrefour EMIA !', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.green)),
                        SizedBox(height: 4),
                        Text('Merci d\'avoir voyagé avec VORA.', style: TextStyle(fontSize: 13, color: AppColors.muted)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),

              // Panneau code ticket
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.greenLight.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(AppRadius.pill)),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.lock, color: Colors.white, size: 14),
                          SizedBox(width: 6),
                          Text('Séquestre Actif', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Container(
                      width: 48, height: 48,
                      decoration: const BoxDecoration(color: AppColors.greenLight, shape: BoxShape.circle),
                      child: const Icon(Icons.verified_user, color: AppColors.green),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    const Text('Votre Code Ticket de Course :',
                        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                    const SizedBox(height: AppSpacing.md),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: digits.map((d) {
                        return Container(
                          width: 56, height: 64,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(AppRadius.sm)),
                          alignment: Alignment.center,
                          child: Text(d, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.navy)),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    const Text(
                      'Dictez ce code temporaire à votre chauffeur pour débloquer son paiement.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.5, color: AppColors.navy, height: 1.4),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Container(width: 40, height: 2, color: AppColors.green),
                    const SizedBox(height: AppSpacing.sm),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.warning_amber_rounded, color: AppColors.green, size: 16),
                        SizedBox(width: 6),
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                              text: 'Ne donnez jamais votre code secret ',
                              style: TextStyle(fontSize: 11.5, color: AppColors.navy),
                              children: [
                                TextSpan(text: 'Mobile Money.', style: TextStyle(color: AppColors.green, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // Carte chauffeur + trajet
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.border)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(radius: 26, backgroundColor: AppColors.greenLight, child: Icon(Icons.person, color: AppColors.green)),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Jean Bataka', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                              Text('Chauffeur partenaire VORA', style: TextStyle(fontSize: 11, color: AppColors.muted)),
                              Row(children: [Icon(Icons.star, color: Colors.amber, size: 14), SizedBox(width: 2), Text('4.9 (128 courses)', style: TextStyle(fontSize: 11))]),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.sm)),
                          child: const Column(children: [Text('LT 234 AB', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)), Text('Toyota Corolla', style: TextStyle(fontSize: 10)), Text('Gris', style: TextStyle(fontSize: 10))]),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: AppSpacing.sm), child: Divider(height: 1)),
                    Row(
                      children: [
                        Expanded(
                          child: Row(children: const [
                            Icon(Icons.access_time, size: 16, color: AppColors.muted),
                            SizedBox(width: 6),
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text('Durée du trajet', style: TextStyle(fontSize: 11, color: AppColors.muted)),
                              Text('25 min', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                            ]),
                          ]),
                        ),
                        Expanded(
                          child: Row(children: const [
                            Icon(Icons.route_outlined, size: 16, color: AppColors.muted),
                            SizedBox(width: 6),
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text('Distance parcourue', style: TextStyle(fontSize: 11, color: AppColors.muted)),
                              Text('8,6 km', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                            ]),
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.warning_amber_rounded, color: Colors.white, size: 18),
                  label: const Text('Signaler un problème', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.lock_outline, size: 14, color: AppColors.muted),
                  SizedBox(width: 4),
                  Text("Vos fonds sont sécurisés jusqu'à la fin de la course.", style: TextStyle(fontSize: 11, color: AppColors.muted)),
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
