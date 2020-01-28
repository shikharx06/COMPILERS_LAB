%{
    #include <stdio.h>
  
  // declaring general variables to count consonants/vowels
  // and uppercase/lowercase letters. 
    int consonants=0;
    int vowels =0;
    int upper =0;
    int lower = 0;
%}

%% 
[aeiou] {
            printf("[lowervowels] "); 
            vowels++;  
            lower++;
        }
[AEIOU] {
            printf("[upper vowels] ");
            vowels++;   
            upper++;
        }
[A-Z]   {
            printf("[upper consonants] ");
            consonants++;
            upper++;
        }
[a-z]   {
            printf("[lower consonants] ");
            consonants++;
            lower++;
        }
\n      {
            printf("[NEWLINE]\n");
            return 1;}
.       {
            printf("[UNRECOGNISED]");
        }
%%

int yywrap()
{
    return 1;
}

//a simple print function to print the count of analyzed string
void print(){      
    printf("vowels : %d \nconsonants : %d \nlowercase :  %d \nuppercase :  %d \n",
            vowels,consonants,lower,upper
          );
}

//driver function
int main()
{ 
    printf("Enter a string : ");
    yylex();
    
    printf("\nThe analysis of the string entered is as follows: \n");
    print();
}

