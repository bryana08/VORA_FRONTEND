/* =====================================================
   VORA — INTERACTIONS FRONTEND
   ===================================================== */

const depart = document.getElementById("depart");
const destination = document.getElementById("destination");
const result = document.getElementById("result");

/* -----------------------------------------------------
   ESTIMATION DU TRAJET
----------------------------------------------------- */

function estimer() {

    const lieuDepart = depart.value.trim();
    const lieuDestination = destination.value.trim();

    if (lieuDepart === "" || lieuDestination === "") {
        result.innerHTML = `
            <div class="result-card">
                ⚠️ Veuillez renseigner le départ et la destination.
            </div>
        `;
        return;
    }

    const prixRecommande = 800;
    const prixMinimum = 700;

    result.innerHTML = `
        <div class="result-card">

            <p>
                📍 <strong>${lieuDepart}</strong>
                →
                <strong>${lieuDestination}</strong>
            </p>

            <br>

            <p>💰 Tarif recommandé</p>

            <strong>${prixRecommande} XAF</strong>

            <p style="margin-top:8px;">
                Vous pouvez négocier à partir de
                <strong>${prixMinimum} XAF</strong>.
            </p>

            <button class="primary full"
                    onclick="reserverCourse()"
                    style="margin-top:15px;">
                🔒 Réserver avec Séquestre MoMo
            </button>

        </div>
    `;
}

function commander() {
    depart.focus();
}

function covoiturage() {
    alert("👥 Fonctionnalité Covoiturage VORA bientôt disponible !");
}


/* -----------------------------------------------------
   RÉSERVATION
----------------------------------------------------- */

function reserverCourse() {

    const lieuDepart = depart.value;
    const lieuDestination = destination.value;

    result.innerHTML = `
        <div class="result-card">

            <h3>🚕 Course recherchée</h3>

            <p style="margin-top:10px;">
                ${lieuDepart} → ${lieuDestination}
            </p>

            <p style="margin-top:10px;">
                💰 Tarif proposé :
                <strong>800 XAF</strong>
            </p>

            <p style="margin-top:10px;">
                🔐 Paiement séquestre activé
            </p>

            <button class="primary full"
                    onclick="confirmerPaiement()"
                    style="margin-top:15px;">
                📱 Payer avec Mobile Money
            </button>

            <button class="secondary full"
                    onclick="paiementCash()"
                    style="margin-top:10px;">
                💵 Payer en espèces
            </button>

        </div>
    `;
}


/* -----------------------------------------------------
   MOBILE MONEY
----------------------------------------------------- */

function confirmerPaiement() {

    result.innerHTML = `
        <div class="result-card">

            <h3>🔐 Paiement sécurisé</h3>

            <p style="margin-top:10px;">
                Vos <strong>800 XAF</strong> seront
                verrouillés jusqu'à la fin de la course.
            </p>

            <label style="display:block;margin-top:10px;font-weight:bold;">Numéro Mobile Money</label>

            <input
                type="tel"
                placeholder="+237 6 XX XX XX XX"
                style="width:100%;padding:10px;margin-top:5px;border-radius:8px;border:1px solid #ccc;"
            >

            <button class="primary full"
                    onclick="paiementEffectue()"
                    style="margin-top:15px;">
                Confirmer le paiement
            </button>

        </div>
    `;
}


/* -----------------------------------------------------
   PAIEMENT VALIDÉ
----------------------------------------------------- */

function paiementEffectue() {

    result.innerHTML = `
        <div class="result-card">

            <h3>✅ Paiement sécurisé</h3>

            <p style="margin-top:10px;">
                Vos fonds sont maintenant
                <strong>séquestrés</strong>.
            </p>

            <p style="margin-top:10px;">
                🚕 Recherche d'un chauffeur à proximité...
            </p>

            <button class="primary full"
                    onclick="afficherChauffeur()"
                    style="margin-top:15px;">
                Voir mon chauffeur
            </button>

        </div>
    `;
}


/* -----------------------------------------------------
   CHAUFFEUR
----------------------------------------------------- */

function afficherChauffeur() {

    result.innerHTML = `
        <div class="result-card">

            <h3>🚕 Chauffeur trouvé</h3>

            <p style="margin-top:12px;">
                <strong>Jean-Paul M.</strong>
            </p>

            <p>
                ⭐ 4.9 / 5
            </p>

            <p style="margin-top:8px;">
                🚕 Toyota Yaris — Taxi jaune
            </p>

            <p>
                🔢 Porte : <strong>YDE-1420</strong>
            </p>

            <p>
                📍 Arrivée dans environ <strong>3 min</strong>
            </p>

            <button class="primary full"
                    onclick="demarrerCourse()"
                    style="margin-top:15px;">
                📍 Suivre le chauffeur
            </button>

        </div>
    `;
}


/* -----------------------------------------------------
   COURSE EN COURS
----------------------------------------------------- */

function demarrerCourse() {

    result.innerHTML = `
        <div class="result-card">

            <h3>🚕 Course en cours</h3>

            <p style="margin-top:10px;">
                📍 Destination :
                <strong>${destination.value}</strong>
            </p>

            <p style="margin-top:10px;">
                🔐 Fonds séquestrés :
                <strong>800 XAF</strong>
            </p>

            <p style="margin-top:10px;">
                🛡️ Sécurité VORA active
            </p>

            <button
                class="primary full"
                onclick="alerteSOS()"
                style="margin-top:15px;background:#EF4444;">
                🚨 SOS / ALERTE DANGER
            </button>

            <button
                class="secondary full"
                onclick="partagerTrajet()"
                style="margin-top:10px;">
                🔗 Partager le suivi en direct
            </button>

        </div>
    `;
}


/* -----------------------------------------------------
   SOS & PARTAGE
----------------------------------------------------- */

function alerteSOS() {
    alert(
        "🚨 ALERTE VORA\n\n" +
        "Votre position peut être partagée " +
        "avec vos contacts de confiance."
    );
}

function partagerTrajet() {
    alert(
        "🔗 Lien de suivi généré.\n\n" +
        "Votre trajet peut maintenant être partagé " +
        "avec un proche."
    );
}


/* -----------------------------------------------------
   PAIEMENT CASH
----------------------------------------------------- */

function paiementCash() {

    result.innerHTML = `
        <div class="result-card">

            <h3>💵 Paiement en espèces</h3>

            <p style="margin-top:10px;">
                Vous avez choisi de payer directement
                le chauffeur en espèces.
            </p>

            <button
                class="primary full"
                onclick="afficherChauffeur()"
                style="margin-top:15px;">
                Rechercher un chauffeur
            </button>

        </div>
    `;
}
