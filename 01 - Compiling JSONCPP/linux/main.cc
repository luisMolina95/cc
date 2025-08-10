#include "include/json/json.h"
#include <iostream>

int main()
{
    constexpr auto jsonString = R"({
        "name": "John Doe",
        "age": 30,
        "isStudent": false,
        "skills": ["C++", "Python"]
    })";

    Json::Reader jsonReader;
    Json::Value jsonValue;
    jsonReader.parse(jsonString, jsonValue);

    std::cout << jsonValue << std::endl;
    return 0;
}