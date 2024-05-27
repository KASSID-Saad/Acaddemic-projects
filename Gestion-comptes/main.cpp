#include <iostream>
#include "Agence.h"

void afficherMenu() {
    std::cout << "Menu:\n";
    std::cout << "1. Creer un nouveau compte\n";
    std::cout << "2. Modifier les informations du titulaire du compte\n";
    std::cout << "3. Resilier un compte\n";
    std::cout << "4. Afficher les informations d'un compte\n";
    std::cout << "5. Afficher tous les comptes d'un client\n";
    std::cout << "6. Afficher le compte ayant le plus grand solde\n";
    std::cout << "7. Deposer de l'argent\n";
    std::cout << "8. Retirer de l'argent\n";
    std::cout << "9. Transferer de l'argent\n";
    std::cout << "10. Afficher l'historique des operations d'un compte\n";
    std::cout << "11. Afficher les soldes de tous les comptes d'un client\n";
    std::cout << "12. Quitter\n";
}

int main() {
    Agence agence("CIH Bank", "Emile Zola");
    int choix;

    afficherMenu();
    do {
        std::cout << "\n";
        std::cout << "Votre choix: ";
        std::cin >> choix;

        switch (choix) {
        case 1: {
            std::string cin, nom, prenom, telephone, adresse, type;
            double solde;
            std::cout << "CIN: ";
            std::cin >> cin;
            std::cout << "Nom: ";
            std::cin >> nom;
            std::cout << "Prenom: ";
            std::cin >> prenom;
            std::cout << "Telephone: ";
            std::cin >> telephone;
            std::cout << "Adresse: ";
            std::cin >> adresse;
            std::cout << "Type de compte (1: cheque, 2: carnet, 3: autre): ";
            int typeNum;
            std::cin >> typeNum;
            switch (typeNum) {
            case 1:
                type = "cheque";
                break;
            case 2:
                type = "carnet";
                break;
            case 3:
                type = "autre";
                break;
            default:
                std::cout << "Type invalide. Utilisation du type par defaut.\n";
                type = "autre";
            }
            std::cout << "Solde initial: ";
            std::cin >> solde;

            Client client(cin, nom, prenom, telephone, adresse);
            Compte compte(client, type, solde);
            agence.creerCompte(compte);
            std::cout << "Nouveau compte cree avec succes. Numero de compte : " << compte.numero << "\n";
            break;
        }
        case 2: {
            std::string cin, nom, prenom, telephone, adresse;
            std::cout << "CIN: ";
            std::cin >> cin;
            std::cout << "Nouveau nom: ";
            std::cin >> nom;
            std::cout << "Nouveau prenom: ";
            std::cin >> prenom;
            std::cout << "Nouveau telephone: ";
            std::cin >> telephone;
            std::cout << "Nouvelle adresse: ";
            std::cin >> adresse;
            agence.modifierClient(cin, nom, prenom, telephone, adresse);
            break;
        }
        case 3: {
            std::string numero;
            std::cout << "Numero de compte: ";
            std::cin >> numero;
            agence.resilierCompte(numero);
            break;
        }
        case 4: {
            std::string numero;
            std::cout << "Numero de compte: ";
            std::cin >> numero;
            Compte* compte = agence.trouverCompte(numero);
            if (compte) {
                std::cout << "Compte " << compte->numero << ":\n";
                std::cout << "Titulaire: " << compte->titulaire.nom << " " << compte->titulaire.prenom << "\n";
                std::cout << "Type: " << compte->type << "\n";
                std::cout << "Solde: " << compte->solde << "\n";
            }
            else {
                std::cout << "Compte non trouve.\n";
            }
            break;
        }
        case 5: {
            std::string cin;
            std::cout << "CIN: ";
            std::cin >> cin;
            std::vector<Compte*> comptes = agence.trouverComptesParCin(cin);
            for (const auto& compte_ptr : comptes) {
                if (compte_ptr) {
                    Compte& compte = *compte_ptr;
                    std::cout << "Compte " << compte.numero << ":\n";
                    std::cout << "Titulaire: " << compte.titulaire.nom << " " << compte.titulaire.prenom << "\n";
                    std::cout << "Type: " << compte.type << "\n";
                    std::cout << "Solde: " << compte.solde << "\n";
                }
                else {
                    std::cout << "Pointeur de compte invalide.\n";
                }
            }
            break;
        }
        case 6: {
            Compte* compte = agence.comptePlusGrandSolde();
            if (compte) {
                std::cout << "Compte ayant le plus grand solde:\n";
                std::cout << "Compte " << compte->numero << ":\n";
                std::cout << "Titulaire: " << compte->titulaire.nom << " " << compte->titulaire.prenom << "\n";
                std::cout << "Type: " << compte->type << "\n";
                std::cout << "Solde: " << compte->solde << "\n";
            }
            else {
                std::cout << "Aucun compte trouve.\n";
            }
            break;
        }
        case 7: {
            std::string numero;
            double montant;
            std::cout << "Numero de compte: ";
            std::cin >> numero;
            std::cout << "Montant a deposer: ";
            std::cin >> montant;
            Compte* compte = agence.trouverCompte(numero);
            if (compte) {
                compte->deposer(montant);
                std::cout << "Depot effectue.\n";
            }
            else {
                std::cout << "Compte non trouve.\n";
            }
            break;
        }
        case 8: {
            std::string numero;
            double montant;
            std::cout << "Numero de compte: ";
            std::cin >> numero;
            std::cout << "Montant a retirer: ";
            std::cin >> montant;
            Compte* compte = agence.trouverCompte(numero);
            if (compte) {
                if (compte->retirer(montant)) {
                    std::cout << "Retrait effectue.\n";
                }
                else {
                    std::cout << "Solde insuffisant.\n";
                }
            }
            else {
                std::cout << "Compte non trouve.\n";
            }
            break;
        }
        case 9: {
            std::string numero_src, numero_dest;
            double montant;
            std::cout << "Numero de compte source: ";
            std::cin >> numero_src;
            std::cout << "Numero de compte destination: ";
            std::cin >> numero_dest;
            std::cout << "Montant a transferer: ";
            std::cin >> montant;
            agence.transfererArgent(numero_src, numero_dest, montant);
            std::cout << "Transfert effectue.\n";
            break;
        }
        case 10: {
            std::string numero;
            std::cout << "Numero de compte: ";
            std::cin >> numero;
            Compte* compte = agence.trouverCompte(numero);
            if (compte) {
                compte->afficherHistorique();
            }
            else {
                std::cout << "Compte non trouve.\n";
            }
            break;
        }
        case 11: {
            std::string cin;
            std::cout << "CIN: ";
            std::cin >> cin;
            agence.afficherSoldesClient(cin);
            break;
        }
        case 12:
            std::cout << "Au revoir!\n";
            break;
        default:
            std::cout << "Choix invalide, veuillez reessayer.\n";
        }
    } while (choix != 12);

    return 0;
}
