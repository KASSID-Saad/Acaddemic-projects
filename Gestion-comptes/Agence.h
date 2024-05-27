#include <string>
#include <vector>
#include "Compte.h"

class Agence {
public:
    std::string nom;
    std::string adresse;
    std::vector<Compte> comptes;

    Agence(std::string nom, std::string adresse);

    void creerCompte(Compte& compte);
    void modifierClient(std::string cin, std::string nom, std::string prenom, std::string telephone, std::string adresse);
    void resilierCompte(std::string numero);
    Compte* trouverCompte(std::string numero);
    std::vector<Compte*> trouverComptesParCin(std::string cin);
    Compte* comptePlusGrandSolde();
    void transfererArgent(std::string numero_src, std::string numero_dest, double montant);
    void afficherSoldesClient(std::string cin);
};
