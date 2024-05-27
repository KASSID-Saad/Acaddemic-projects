#include <vector>
#include <string>
#include <ctime>
#include "Client.h"
#include "Operation.h"

class Compte {
public:
    std::string numero;
    Client titulaire;
    std::string type;
    double solde;
    std::vector<Operation> operations;

    Compte(Client titulaire, std::string type, double solde = 0.0);

    void genererNumero();
    void deposer(double montant);
    bool retirer(double montant);
    void afficherHistorique() const;
};
