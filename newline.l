
%{
%}


%%


.		{printf("%s\n", yytext);}
\n 		{return 0;}


%%


int yywrap(){}

int main()
{

	yylex();

	return EXIT_SUCCESS;
}
