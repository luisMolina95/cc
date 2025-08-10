#include <iostream>



int main(int argc, char const *argv[])
{
   try
   {
    std::cout << "Hello" << std::endl;
    int *intPtr = new int;
    delete intPtr;
    std::cout << "Hello" << std::endl;
    delete intPtr;
    std::cout << "Hello" << std::endl;
    
   }
   catch(const std::exception& e)
   {
    std::cout << "Hello" << std::endl;
    std::cout << "Caught exception: " << e.what() << '\n';
   }
   std::cout << "Hello" << std::endl;
   return 0;
}
