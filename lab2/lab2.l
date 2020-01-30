
/***PREPROCESSOR DEFINITION AND COUNTER DECLARATION***/
%{
    #include <stdio.h>
    #include <string.h>
    int largest_word_count=0;
    char largest_word[100];
%}

/***RULE SECTION***/
%%
[a-zA-Z]+ { 
             if (yyleng >largest_word_count)  // if not yyleng, then strlen(yytext)
            { 
               largest_word_count = yyleng;
               strcpy(largest_word,yytext);   
            } 
        } 
[ \t] {}        
.     {}
\n  {
        return 1; //or i can write yyterminate();
    }        
%%

int yywrap()
{
    return 1;
}

//driver function
int main() { 
  printf("Enter a string:");
  yylex(); 

  printf("\nLargest word is : %s",largest_word);
  printf("\nLength of the word: %d",largest_word_count); 
  printf("\n"); 
} 