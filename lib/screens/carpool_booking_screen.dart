import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';

enum SeatStatus { occupied, free, empty }

enum CarpoolPayment { momo, cash }

class CarpoolBookingScreen extends StatefulWidget {
  const CarpoolBookingScreen({super.key});

  @override
  State<CarpoolBookingScreen> createState() => _CarpoolBookingScreenState();
}

class _CarpoolBookingScreenState extends State<CarpoolBookingScreen> {
  CarpoolPayment payment = CarpoolPayment.momo;
  final int pricePerSeat = 500;
  final int privatePrice = 800;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
              child: Row(
                children: [
                  const VoraLogo(size: 34),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.person_outline, color: AppColors.navy, size: 16),
                        SizedBox(width: 4),
                        Text('Passager', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.navy)),
                        Icon(Icons.expand_more, size: 16, color: AppColors.navy),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Bandeau covoiturage
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(AppRadius.pill)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.local_taxi, color: Colors.white, size: 16),
                            SizedBox(width: 6),
                            Text('COVOITURAGE - ÉCONOMISEZ 35%',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),

                    // Carte (placeholder)
                    Container(
                      height: 220,
                      width: double.infinity,
                      color: const Color(0xFFEDEEEA),
                      child: Stack(
                        children: [
                          const Center(child: Icon(Icons.map_outlined, size: 56, color: Color(0xFFC7CCC8))),
                          Positioned(
                            bottom: 12, left: AppSpacing.md,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(AppRadius.sm)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.people, color: AppColors.green, size: 14),
                                  SizedBox(width: 4),
                                  Text('4 passagers au total', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.navy)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Panneau sombre : sièges + prix
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: const BoxDecoration(
                        color: AppColors.dark,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(AppRadius.sm)),
                                child: const Icon(Icons.groups, color: Colors.white, size: 20),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              const Expanded(
                                child: Text('Rejoindre une course partagée (Bastos → Mokolo)',
                                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.md),

                          Container(
                            padding: const EdgeInsets.all(AppSpacing.md),
                            decoration: BoxDecoration(border: Border.all(color: Colors.white24), borderRadius: BorderRadius.circular(AppRadius.md)),
                            child: Row(
                              children: [
                                _Seat(status: SeatStatus.occupied, label: 'Occupé'),
                                _Seat(status: SeatStatus.occupied, label: 'Occupé'),
                                _Seat(status: SeatStatus.free, label: 'Libre', selected: true),
                                _Seat(status: SeatStatus.empty, label: 'Vide'),
                                const Spacer(),
                                Container(width: 1, height: 50, color: Colors.white24),
                                const SizedBox(width: AppSpacing.sm),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: const [
                                      Icon(Icons.local_offer_outlined, color: Colors.white70, size: 12),
                                      SizedBox(width: 4),
                                      Text('Tarif Covoiturage', style: TextStyle(color: Colors.white70, fontSize: 11)),
                                    ]),
                                    Text('$pricePerSeat XAF', style: const TextStyle(color: AppColors.green, fontSize: 22, fontWeight: FontWeight.bold)),
                                    const Text('/ place', style: TextStyle(color: Colors.white54, fontSize: 10)),
                                    Row(children: [
                                      Text('$privatePrice XAF',
                                          style: const TextStyle(color: Colors.white38, fontSize: 11, decoration: TextDecoration.lineThrough)),
                                      const SizedBox(width: 6),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(AppRadius.pill)),
                                        child: const Text('Course privée', style: TextStyle(color: Colors.white70, fontSize: 9)),
                                      ),
                                    ]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),

                          Container(
                            padding: const EdgeInsets.all(AppSpacing.sm),
                            decoration: BoxDecoration(color: const Color(0xFF1A2420), borderRadius: BorderRadius.circular(AppRadius.md)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: const [
                                  Icon(Icons.person, color: Colors.white, size: 16),
                                  SizedBox(width: 6),
                                  Text('Passagers à bord', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                                ]),
                                const SizedBox(height: AppSpacing.sm),
                                Container(
                                  padding: const EdgeInsets.all(AppSpacing.sm),
                                  decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(AppRadius.sm)),
                                  child: Row(
                                    children: [
                                      const CircleAvatar(radius: 20, backgroundColor: AppColors.greenLight, child: Icon(Icons.person, color: AppColors.green, size: 20)),
                                      const SizedBox(width: AppSpacing.sm),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(children: const [
                                              Text('Chauffeur : Paul K.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.5, color: AppColors.navy)),
                                              SizedBox(width: 4),
                                              Icon(Icons.verified, color: AppColors.green, size: 14),
                                            ]),
                                            const Text('Passager 1 déjà à bord', style: TextStyle(fontSize: 11, color: AppColors.muted)),
                                            const Text('(Dépose : Carrefour EMIA)', style: TextStyle(fontSize: 10, color: AppColors.green)),
                                          ],
                                        ),
                                      ),
                                      const Icon(Icons.chevron_right, color: AppColors.muted, size: 18),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: AppSpacing.sm),
                                Container(
                                  padding: const EdgeInsets.all(AppSpacing.sm),
                                  decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.sm)),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.shield, color: AppColors.green, size: 16),
                                      SizedBox(width: 6),
                                      Expanded(
                                        child: Text('Chaque passager dispose de son propre Code Séquestre MoMo individuel.',
                                            style: TextStyle(fontSize: 11, color: AppColors.greenDark)),
                                      ),
                                      Icon(Icons.credit_card, color: Colors.blue, size: 18),
                                      SizedBox(width: 2),
                                      Text('MoMo', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.navy)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Mode de paiement (fond clair)
                    Container(
                      width: double.infinity,
                      color: AppColors.bg,
                      padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Choisissez votre mode de paiement', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                          const SizedBox(height: AppSpacing.sm),
                          Row(
                            children: [
                              Expanded(
                                child: _PaymentChip(
                                  label: 'MoMo',
                                  sublabel: 'Séquestre individuel',
                                  selected: payment == CarpoolPayment.momo,
                                  onTap: () => setState(() => payment = CarpoolPayment.momo),
                                ),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: _PaymentChip(
                                  label: 'Payer en espèces',
                                  sublabel: 'Au chauffeur',
                                  selected: payment == CarpoolPayment.cash,
                                  onTap: () => setState(() => payment = CarpoolPayment.cash),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.md),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // TODO: appeler ride_service.dart -> POST /rides/carpool/join
                              },
                              icon: const Icon(Icons.event_seat, color: Colors.white, size: 18),
                              label: Text('Réserver ma place ($pricePerSeat XAF Séquestre)',
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.green,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sm),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              _MiniFeature(icon: Icons.shield_outlined, label: 'Trajet partagé sécurisé'),
                              _MiniFeature(icon: Icons.eco_outlined, label: 'Moins de CO2'),
                              _MiniFeature(icon: Icons.groups_outlined, label: 'Plus économique'),
                            ],
                          ),
                        ],
                      ),
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
}

class _Seat extends StatelessWidget {
  final SeatStatus status;
  final String label;
  final bool selected;
  const _Seat({required this.status, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color iconColor;
    switch (status) {
      case SeatStatus.occupied:
        bg = AppColors.green;
        iconColor = Colors.white;
        break;
      case SeatStatus.free:
        bg = Colors.transparent;
        iconColor = AppColors.green;
        break;
      case SeatStatus.empty:
        bg = const Color(0xFF2A3330);
        iconColor = Colors.white24;
        break;
    }
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(
              color: bg,
              shape: BoxShape.circle,
              border: selected ? Border.all(color: AppColors.green, width: 2) : null,
            ),
            child: Stack(
              children: [
                Center(child: Icon(Icons.event_seat, color: iconColor, size: 20)),
                if (selected)
                  const Positioned(
                    right: -2, bottom: -2,
                    child: Icon(Icons.check_circle, color: AppColors.green, size: 14),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white60, fontSize: 9)),
        ],
      ),
    );
  }
}

class _PaymentChip extends StatelessWidget {
  final String label;
  final String sublabel;
  final bool selected;
  final VoidCallback onTap;
  const _PaymentChip({required this.label, required this.sublabel, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: selected ? AppColors.green : AppColors.border, width: selected ? 1.5 : 1),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.navy)),
                  Text(sublabel, style: const TextStyle(fontSize: 10, color: AppColors.muted)),
                ],
              ),
            ),
            Icon(selected ? Icons.check_circle : Icons.circle_outlined, color: selected ? AppColors.green : AppColors.border, size: 18),
          ],
        ),
      ),
    );
  }
}

class _MiniFeature extends StatelessWidget {
  final IconData icon;
  final String label;
  const _MiniFeature({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.green, size: 14),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 10, color: AppColors.muted)),
      ],
    );
  }
}
