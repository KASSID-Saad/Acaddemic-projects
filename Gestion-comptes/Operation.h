#include <string>
#include <ctime>

class Operation {
public:
    std::string type;
    double montant;
    bool reussie;
    time_t date;

    Operation(std::string type, double montant, bool reussie);
};
