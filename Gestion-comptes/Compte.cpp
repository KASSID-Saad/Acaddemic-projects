#define _CRT_SECURE_NO_WARNINGS

#include "Compte.h"
#include <random>
#include <sstream>
#include <iomanip>
#include <ctime>
#include <iostream>

Compte::Compte(Client titulaire, std::string type, double solde)
    : titulaire(titulaire), type(type), solde(solde) {
    genererNumero();
}

void Compte::genererNumero() {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 999999999);
    int numAleatoire = dis(gen);

    std::stringstream ss;
    ss << std::setw(11) << std::setfill('0') << numAleatoire;
    std::string numString = ss.str();

    if (type == "cheque") {
        numero = "CHQ" + numString;
    }
    else if (type == "carnet") {
        numero = "CRN" + numString;
    }
    else {
        numero = "ATR" + numString;
    }
}

void Compte::deposer(double montant) {
    solde += montant;
    operations.push_back(Operation("Depot", montant, true));
}

bool Compte::retirer(double montant) {
    if (solde >= montant) {
        solde -= montant;
        operations.push_back(Operation("Retrait", montant, true));
        return true;
    }
    else {
        operations.push_back(Operation("Retrait", montant, false));
        return false;
    }
}

void Compte::afficherHistorique() const {
    for (const auto& operation : operations) {
        char buffer[80];
        struct tm timeinfo;
        localtime_s(&timeinfo, &operation.date);
        strftime(buffer, sizeof(buffer), "%Y-%m-%d %H:%M:%S", &timeinfo);
        std::cout << "Date: " << buffer << ", Type: " << operation.type << ", Montant: " << operation.montant << ", Reussie: " << (operation.reussie ? "Oui" : "Non") << "\n";
    }
}
