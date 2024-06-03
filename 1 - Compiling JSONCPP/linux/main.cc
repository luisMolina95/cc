#include "include/json/json.h"
#include <iostream>
#include <string>

int main()
{
    // Example JSON string
    std::string jsonString = R"({
        "name": "John Doe",
        "age": 30,
        "is_student": false,
        "skills": ["C++", "Python"]
    })";

    // Parsing JSON data from the string
    Json::CharReaderBuilder reader;
    Json::Value root;
    std::string errors;

    std::istringstream iss(jsonString);
    std::string errs;
    if (!Json::parseFromStream(reader, iss, &root, &errs))
    {
        std::cerr << "Error parsing JSON: " << errs << std::endl;
        return 1;
    }

    // Accessing data from the JSON object
    std::string name = root["name"].asString();
    int age = root["age"].asInt();
    bool isStudent = root["is_student"].asBool();

    std::cout << "Name: " << name << std::endl;
    std::cout << "Age: " << age << std::endl;
    std::cout << "Is Student: " << isStudent << std::endl;

    // Accessing data from the JSON array
    const Json::Value skills = root["skills"];
    for (int i = 0; i < skills.size(); ++i)
    {
        std::cout << "Skill: " << skills[i].asString() << std::endl;
    }

    return 0;
}