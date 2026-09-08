<<<<<<< HEAD
=======
# VORA_FRONTEND
>>>>>>> d1d1fa173da45b58736829c09153e1516bd8f6ac
# VORA — Application Mobile Passager & Chauffeur

**Hackathon NuxCine 2026**

VORA est une application de mobilité intelligente pensée pour les réalités du transport urbain au Cameroun. Elle permet aux passagers de réserver des courses (privées ou en covoiturage), de négocier leur tarif en toute transparence, et de payer via un système de **paiement séquestre Mobile Money** qui protège à la fois le passager et le chauffeur.

<<<<<<< HEAD
##  Fonctionnalités principales
=======
## ✨ Fonctionnalités principales
>>>>>>> d1d1fa173da45b58736829c09153e1516bd8f6ac

### Côté Passager
- Onboarding et création de compte
- Recherche de trajet avec assistant vocal IA (Gemini)
- Réservation en course privée ou en covoiturage (sièges partagés)
- Négociation du prix de la course
- Paiement sécurisé : MTN MoMo, Orange Money ou espèces
- Séquestre des fonds débloqué par un code ticket à 4 chiffres à l'arrivée
- Suivi en temps réel du chauffeur sur la carte
- Alertes météo avec tarification incitative en cas de mauvais temps
- Bouton SOS et partage de trajet en direct avec les proches
- Annulation de course avec motif

### Côté Chauffeur
- Inscription avec vérification des documents (CNI, permis, carte grise)
- Statut de vérification du dossier
- Mode en ligne / hors ligne avec carte des zones à forte demande
- Acceptation ou refus des courses proposées (avec compte à rebours)
- Feuille de route multi-arrêts pour les courses en covoiturage
- Validation de l'arrivée via saisie du code ticket du passager
- Suivi des gains du jour et du portefeuille

<<<<<<< HEAD
##  Stack technique
=======
## 🛠️ Stack technique
>>>>>>> d1d1fa173da45b58736829c09153e1516bd8f6ac

- **Framework** : Flutter
- **Backend** : [VORA_BACKEND](https://github.com/Asanflo/VORA_BACKEND) — FastAPI + SQLModel, développé par [@Asanflo](https://github.com/Asanflo)
- **Communication temps réel** : WebSockets (suivi de course, négociation)
- **Authentification** : OTP par numéro de téléphone (+237)

<<<<<<< HEAD
## Structure du projet# VORA_FRONTEND
Voici le contenu à mettre dans ton README.md. Ouvre-le et remplace tout le contenu existant :
Code
Colle ceci :
=======
## 📁 Structure du projet
>>>>>>> d1d1fa173da45b58736829c09153e1516bd8f6ac
Markdown
lib/
├── main.dart
├── core/
│   └── constants.dart       # Couleurs, espacements, rayons (design system)
├── widgets/
│   ├── vora_logo.dart
│   ├── voice_assistant_sheet.dart
│   ├── primary_button.dart
│   └── outline_button.dart
├── screens/
│   ├── onboarding_screen.dart
│   ├── signup_screen.dart
│   ├── profile_choice_screen.dart
│   ├── home_screen.dart
│   ├── price_negotiation_screen.dart
│   ├── payment_method_screen.dart
│   ├── ride_in_progress_screen.dart
│   ├── arrival_screen.dart
│   ├── cancel_ride_screen.dart
│   ├── carpool_booking_screen.dart
│   ├── carpool_tracking_screen.dart
│   ├── driver_approaching_screen.dart
│   ├── driver_home_screen.dart
│   ├── driver_signup_screen.dart
│   ├── driver_pending_verification_screen.dart
│   ├── driver_route_screen.dart
│   ├── driver_validate_arrival_screen.dart
│   ├── safety_screen.dart
│   └── weather_alert_screen.dart
<<<<<<< HEAD
Code
Build APK (pour tester sur d'autres appareils)
Bash
L'APK généré se trouve dans build/app/outputs/flutter-apk/app-release.apk.
 Équipe
Projet réalisé dans le cadre du Hackathon NuxCine 2026.
Frontend mobile (Flutter) : @bryana08
Backend (FastAPI) : @Asanflo
 Licence
Projet développé dans un cadre académique / compétitif (Hackathon NuxCine 2026).



=======
>>>>>>> d1d1fa173da45b58736829c09153e1516bd8f6ac
##  Démarrage

### Prérequis
- Flutter SDK installé (`flutter --version` pour vérifier)
- Un appareil Android/iOS connecté ou un émulateur

### Installation

```bash
git clone https://github.com/bryana08/VORA_FRONTEND.git
cd VORA_FRONTEND
flutter pub get
flutter run

<<<<<<< HEAD
## Outils utilisés

### Frontend (ce dépôt)
- **Flutter / Dart** — framework de développement mobile
- **VS Code** — éditeur de code
- **Git / GitHub** — gestion de version et collaboration

### Backend
- **FastAPI + SQLModel** — API et modèles de données
- Voir [VORA_BACKEND](https://github.com/Asanflo/VORA_BACKEND) pour le détail

Équipe
Projet réalisé dans le cadre du Hackathon NuxCine 2026
Frontend mobile (Flutter) : @bryana08
Backend (FastAPI) : @Asanflo

=======



### Équipe

Projet réalisé dans le cadre du Hackathon NuxCine 2026.
Frontend mobile (Flutter) : @bryana08
Backend (FastAPI) : @Asanflo
>>>>>>> d1d1fa173da45b58736829c09153e1516bd8f6ac
