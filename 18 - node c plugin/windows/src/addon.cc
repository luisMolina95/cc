#include <iostream>
#include <node.h>

void Initialize(v8::Local<v8::Object> exports){
    std::cout << "Hi From C++!" << std::endl;
}

NODE_MODULE(MODE_GYP_MODULE_NAME, Initialize)