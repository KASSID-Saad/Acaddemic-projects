#include "Operation.h"

Operation::Operation(std::string type, double montant, bool reussie)
    : type(type), montant(montant), reussie(reussie), date(time(nullptr)) {}
