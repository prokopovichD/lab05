#include <print.hpp>
#include <fstream>

int main(int argc, char** argv) {
    std::ofstream file("log.txt");
    print(std::string("hello"), file);
    print(std::string("world"));     
    return 0;
}
