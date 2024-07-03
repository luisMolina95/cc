// main.cpp
#include "MyClass.h"
#include <iostream>

int main() {
    const auto test1 = MyClass{7,"seven"};
     std::cout << test1.name << std::endl;
    // Create an instance of MyClass using the parameterized constructor
    MyClass myObject(42, "Alice");

    // Display the message
    myObject.displayMessage();

    // Modify the name attribute directly
    myObject.name = "Bob";
    

    // Display the message again
    myObject.displayMessage();

    return 0;
}
