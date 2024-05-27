#include "Agence.h"
#include <iostream>

Agence::Agence(std::string nom, std::string adresse)
    : nom(nom), adresse(adresse) {}

void Agence::creerCompte(Compte& compte) {
    comptes.push_back(compte);
}

void Agence::modifierClient(std::string cin, std::string nom, std::string prenom, std::string telephone, std::string adresse) {
    for (auto& compte : comptes) {
        if (compte.titulaire.cin == cin) {
            compte.titulaire.nom = nom;
            compte.titulaire.prenom = prenom;
            compte.titulaire.telephone = telephone;
            compte.titulaire.adresse = adresse;
        }
    }
}

void Agence::resilierCompte(std::string numero) {
    comptes.erase(std::remove_if(comptes.begin(), comptes.end(), [numero](const Compte& compte) {
        return compte.numero == numero;
        }), comptes.end());
}

Compte* Agence::trouverCompte(std::string numero) {
    for (auto& compte : comptes) {
        if (compte.numero == numero) {
            return &compte;
        }
    }
    return nullptr;
}

std::vector<Compte*> Agence::trouverComptesParCin(std::string cin) {
    std::vector<Compte*> result;
    for (auto& compte : comptes) {
        if (compte.titulaire.cin == cin) {
            result.push_back(&compte);
        }
    }
    return result;
}

Compte* Agence::comptePlusGrandSolde() {
    if (comptes.empty()) {
        return nullptr;
    }

    Compte* maxCompte = &comptes[0];
    for (auto& compte : comptes) {
        if (compte.solde > maxCompte->solde) {
            maxCompte = &compte;
        }
    }
    return maxCompte;
}

void Agence::transfererArgent(std::string numero_src, std::string numero_dest, double montant) {
    Compte* compte_src = trouverCompte(numero_src);
    Compte* compte_dest = trouverCompte(numero_dest);

    if (compte_src && compte_dest) {
        if (compte_src->retirer(montant)) {
            compte_dest->deposer(montant);
        }
    }
}

void Agence::afficherSoldesClient(std::string cin) {
    std::vector<Compte*> comptesClient = trouverComptesParCin(cin);
    for (const auto& compte : comptesClient) {
        std::cout << "Compte " << compte->numero << ": Solde = " << compte->solde << "\n";
    }
}
