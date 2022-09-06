
%{
int state = 1;

void raise_error(const char *c);
%}


C	[kKgGfcCjJFtTdDNwWxXnpPbBmyrlvSRsh]
V	[aAiIuUeEoOqQL]
Z	[MHz]


%%


{C} 	{if (state == 1) {printf("%s", yytext);} else {printf(" %s", yytext);} state = 1;}
{V}	  	{if (state == 1) {printf("%s", yytext);} else {printf(" %s", yytext);} state = 2;}
{Z} 	{if (state == 2) {printf("%s", yytext); state = 3;} else {raise_error(yytext);}}
.		{raise_error(yytext);}
\n 		{return 0;}


%%


void raise_error(const char *c) 
{
	fprintf(stderr, "Unexpected: %s\n", c);

	exit(EXIT_FAILURE);
}

int yywrap(){}

int main()
{

	yylex();

	return EXIT_SUCCESS;
}
