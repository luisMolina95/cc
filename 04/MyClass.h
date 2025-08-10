// MyClass.h
#ifndef MYCLASS_H
#define MYCLASS_H

#include <string>

/**
 * @brief Represents a simple MyClass.
 */
class MyClass {
public:
    /**
     * @brief Default constructor.
     */
    MyClass();

    /**
     * @brief Parameterized constructor.
     * 
     * @param initData Initial value for data member.
     * @param initName Initial value for name member.
     */
    MyClass(int initData, const std::string& initName);

    /**
     * @brief Destructor.
     */
    ~MyClass();

    /**
     * @brief Displays a message with current object state.
     */
    void displayMessage();

    // Public data member
    std::string name;

private:
    // Data member
    int data;
};

#endif // MYCLASS_H
