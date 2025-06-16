// print.hpp
#pragma once
#include <fstream>
#include <iostream>
#include <string>

inline void print(const std::string& text, std::ostream& out = std::cout) {
    out << text << std::endl;
}

void print(const std::string& text, std::ofstream& out);
