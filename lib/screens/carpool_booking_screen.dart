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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
              child: Row(
                children: [
                  const VoraLogo(size: 34),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(AppRadius.pill), border: Border.all(color: AppColors.border)),
                    child: Row(mainAxisSize: MainAxisSize.min, children: const [
                      Icon(Icons.person_outline, color: AppColors.navy, size: 16),
                      SizedBox(width: 4),
                      Text('Passager', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.navy)),
                      Icon(Icons.expand_more, size: 16, color: AppColors.navy),
                    ]),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(AppRadius.pill)),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                          Icon(Icons.local_taxi, color: Colors.white, size: 16),
                          SizedBox(width: 6),
                          Text('COVOITURAGE - ÉCONOMISEZ 35%', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                        ]),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Container(
                      height: 200, width: double.infinity, color: const Color(0xFFEDEEEA),
                      child: Stack(children: [
                        const Center(child: Icon(Icons.map_outlined, size: 56, color: Color(0xFFC7CCC8))),
                        Positioned(
                          bottom: 12, left: AppSpacing.md,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(AppRadius.sm)),
                            child: Row(mainAxisSize: MainAxisSize.min, children: const [
                              Icon(Icons.people, color: AppColors.green, size: 14),
                              SizedBox(width: 4),
                              Text('4 passagers au total', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.navy)),
                            ]),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: const BoxDecoration(color: AppColors.dark, borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(AppRadius.sm)), child: const Icon(Icons.groups, color: Colors.white, size: 20)),
                            const SizedBox(width: AppSpacing.sm),
                            const Expanded(child: Text('Rejoindre une course partagée (Bastos → Mokolo)', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))),
                          ]),
                          const SizedBox(height: AppSpacing.md),
                          Container(
                            padding: const EdgeInsets.all(AppSpacing.md),
                            decoration: BoxDecoration(border: Border.all(color: Colors.white24), borderRadius: BorderRadius.circular(AppRadius.md)),
                            child: Row(children: [
                              _Seat(status: SeatStatus.occupied, label: 'Occupé'),
                              _Seat(status: SeatStatus.occupied, label: 'Occupé'),
                              _Seat(status: SeatStatus.free, label: 'Libre', selected: true),
                              _Seat(status: SeatStatus.empty, label: 'Vide'),
                              const Spacer(),
                              Container(width: 1, height: 50, color: Colors.white24),
                              const SizedBox(width: AppSpacing.sm),
                              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Text('$pricePerSeat XAF', style: const TextStyle(color: AppColors.green, fontSize: 22, fontWeight: FontWeight.bold)),
                                const Text('/ place', style: TextStyle(color: Colors.white54, fontSize: 10)),
                                Text('$privatePrice XAF', style: const TextStyle(color: Colors.white38, fontSize: 11, decoration: TextDecoration.lineThrough)),
                              ]),
                            ]),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Container(
                            padding: const EdgeInsets.all(AppSpacing.sm),
                            decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.sm)),
                            child: Row(children: const [
                              Icon(Icons.shield, color: AppColors.green, size: 16),
                              SizedBox(width: 6),
                              Expanded(child: Text('Chaque passager dispose de son propre Code Séquestre MoMo individuel.', style: TextStyle(fontSize: 11, color: AppColors.greenDark))),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: AppColors.bg,
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Choisissez votre mode de paiement', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                          const SizedBox(height: AppSpacing.sm),
                          Row(children: [
                            Expanded(child: _PaymentChip(label: 'MoMo', sublabel: 'Séquestre individuel', selected: payment == CarpoolPayment.momo, onTap: () => setState(() => payment = CarpoolPayment.momo))),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(child: _PaymentChip(label: 'Espèces', sublabel: 'Au chauffeur', selected: payment == CarpoolPayment.cash, onTap: () => setState(() => payment = CarpoolPayment.cash))),
                          ]),
                          const SizedBox(height: AppSpacing.md),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.event_seat, color: Colors.white, size: 18),
                              label: Text('Réserver ma place ($pricePerSeat XAF Séquestre)', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill))),
                            ),
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
    Color bg; Color iconColor;
    switch (status) {
      case SeatStatus.occupied: bg = AppColors.green; iconColor = Colors.white; break;
      case SeatStatus.free: bg = Colors.transparent; iconColor = AppColors.green; break;
      case SeatStatus.empty: bg = const Color(0xFF2A3330); iconColor = Colors.white24; break;
    }
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(children: [
        Container(
          width: 44, height: 44,
          decoration: BoxDecoration(color: bg, shape: BoxShape.circle, border: selected ? Border.all(color: AppColors.green, width: 2) : null),
          child: Center(child: Icon(Icons.event_seat, color: iconColor, size: 20)),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white60, fontSize: 9)),
      ]),
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
        decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: selected ? AppColors.green : AppColors.border, width: selected ? 1.5 : 1)),
        child: Row(children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.navy)),
            Text(sublabel, style: const TextStyle(fontSize: 10, color: AppColors.muted)),
          ])),
          Icon(selected ? Icons.check_circle : Icons.circle_outlined, color: selected ? AppColors.green : AppColors.border, size: 18),
        ]),
      ),
    );
  }
}
