// MyClass.cpp
#include "MyClass.h"
#include <iostream>

// Default constructor implementation
MyClass::MyClass() : data(0), name("") {}

// Parameterized constructor implementation
MyClass::MyClass(int initData, const std::string& initName) : data(initData), name(initName) {}

// Destructor implementation
MyClass::~MyClass() {}

// Member function implementation
void MyClass::displayMessage() {
    std::cout << "Hello from MyClass! Name: " << name << ", Data: " << data << std::endl;
}
