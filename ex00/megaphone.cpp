#include <iostream>
#include <cstdlib>

int main(int argc, char const *argv[])
{
    if (argc == 1)
    {
        std::cout << "* LOUD AND UNBEARABLE FEEDBACK NOISE *" << std::endl;
    }
    else
    {
        for (int i = 1; argv[i]; i++)
        {
            for (size_t j = 0; argv[i][j]; j++)
            {
                std::cout << static_cast<char>(std::toupper(argv[i][j]));
            }
        }
        std::cout << std::endl;
    }
    return EXIT_SUCCESS;
}
