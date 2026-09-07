import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';

enum DriverPayment { mobileMoney, cash }

class DriverValidateArrivalScreen extends StatefulWidget {
  final String expectedCode;
  final int amount;

  const DriverValidateArrivalScreen({super.key, this.expectedCode = '4821', this.amount = 700});

  @override
  State<DriverValidateArrivalScreen> createState() => _DriverValidateArrivalScreenState();
}

class _DriverValidateArrivalScreenState extends State<DriverValidateArrivalScreen> {
  String enteredCode = '';
  DriverPayment payment = DriverPayment.mobileMoney;

  void addDigit(String d) {
    if (enteredCode.length < 4) {
      setState(() => enteredCode += d);
    }
  }

  void removeDigit() {
    if (enteredCode.isNotEmpty) {
      setState(() => enteredCode = enteredCode.substring(0, enteredCode.length - 1));
    }
  }

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
                  const VoraLogo(size: 30),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.pill)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.circle, color: AppColors.green, size: 8),
                        SizedBox(width: 6),
                        Text('Course en cours', style: TextStyle(color: AppColors.greenDark, fontSize: 11, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.notifications_none, color: AppColors.navy),
                ],
              ),
              const SizedBox(height: AppSpacing.md),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.lg)),
                child: Row(
                  children: [
                    const Icon(Icons.flag, color: AppColors.greenDark, size: 28),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Valider l'arrivée -", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.navy)),
                          Text('${widget.amount} XAF à recevoir', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.greenDark)),
                        ],
                      ),
                    ),
                    const Icon(Icons.directions_car, color: AppColors.green, size: 30),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(color: AppColors.greenLight.withOpacity(0.5), borderRadius: BorderRadius.circular(AppRadius.md)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.info_outline, color: AppColors.greenDark, size: 18),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: 'Demandez le ',
                          style: TextStyle(fontSize: 12.5, color: AppColors.navy),
                          children: [
                            TextSpan(text: 'Code Ticket à 4 chiffres', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' au passager pour débloquer les fonds de votre compte séquestre.'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Cases du code
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (i) {
                  final filled = i < enteredCode.length;
                  return Container(
                    width: 64, height: 64,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.green, width: 1.5),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    alignment: Alignment.center,
                    child: filled
                        ? Text(enteredCode[i], style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.navy))
                        : Container(width: 16, height: 2, color: AppColors.border),
                  );
                }),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Clavier numérique
              _NumPad(onDigit: addDigit, onDelete: removeDigit),
              const SizedBox(height: AppSpacing.lg),

              Row(
                children: [
                  Expanded(
                    child: _PayOption(
                      icon: Icons.smartphone,
                      label: 'Paiement Mobile Money',
                      sublabel: 'Fonds déjà en séquestre',
                      selected: payment == DriverPayment.mobileMoney,
                      onTap: () => setState(() => payment = DriverPayment.mobileMoney),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: _PayOption(
                      icon: Icons.payments_outlined,
                      label: 'Paiement en espèces',
                      sublabel: 'Vous recevrez le montant en liquide',
                      selected: payment == DriverPayment.cash,
                      onTap: () => setState(() => payment = DriverPayment.cash),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),

              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Icons.warning_amber_rounded, color: AppColors.green, size: 16),
                        const SizedBox(width: 4),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text('L\'utilisateur refuse le code ?  →', style: TextStyle(fontSize: 11.5, color: AppColors.navy)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: appeler ride_service.dart -> POST /rides/{id}/dispute
                  },
                  icon: const Icon(Icons.location_on_outlined, color: AppColors.green, size: 18),
                  label: const Text('Déclencher Vérification GPS / Litige', style: TextStyle(color: AppColors.green, fontSize: 12.5, fontWeight: FontWeight.bold)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.green),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: enteredCode.length == 4
                      ? () {
                          // TODO: comparer enteredCode à widget.expectedCode côté backend
                          // POST /rides/{id}/confirm-arrival avec le code
                        }
                      : null,
                  icon: const Icon(Icons.check_circle, color: Colors.white, size: 20),
                  label: const Text('Valider et Recevoir le Paiement', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    disabledBackgroundColor: AppColors.green.withOpacity(0.4),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.shield_outlined, size: 14, color: AppColors.muted),
                  SizedBox(width: 4),
                  Text('Paiement sécurisé par VORA', style: TextStyle(fontSize: 11, color: AppColors.muted)),
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

class _NumPad extends StatelessWidget {
  final void Function(String) onDigit;
  final VoidCallback onDelete;
  const _NumPad({required this.onDigit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
    ];
    return Column(
      children: [
        for (final row in rows)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: row.map((d) => _Key(label: d, onTap: () => onDigit(d))).toList(),
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _Key(icon: Icons.backspace_outlined, onTap: onDelete),
            _Key(label: '0', onTap: () => onDigit('0')),
            _Key(icon: Icons.fingerprint, onTap: () {}),
          ],
        ),
      ],
    );
  }
}

class _Key extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback onTap;
  const _Key({this.label, this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        width: 96, height: 56,
        decoration: BoxDecoration(color: const Color(0xFFF0F2F0), borderRadius: BorderRadius.circular(AppRadius.md)),
        alignment: Alignment.center,
        child: label != null
            ? Text(label!, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.navy))
            : Icon(icon, color: AppColors.navy),
      ),
    );
  }
}

class _PayOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sublabel;
  final bool selected;
  final VoidCallback onTap;
  const _PayOption({required this.icon, required this.label, required this.sublabel, required this.selected, required this.onTap});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.greenDark, size: 20),
                const Spacer(),
                Icon(selected ? Icons.check_circle : Icons.circle_outlined, color: selected ? AppColors.green : AppColors.border, size: 18),
              ],
            ),
            const SizedBox(height: 6),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.5, color: AppColors.navy)),
            Text(sublabel, style: const TextStyle(fontSize: 10, color: AppColors.muted)),
          ],
        ),
      ),
    );
  }
}
