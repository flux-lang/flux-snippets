// vim: syntax=rust 

// strings

"double-quoted string";
'single-quoted string';

// integer literals

10; // decimal
1_000_000; // _ separator can be used
0b10; // binary (2)
0o77; // octal (63)
0xAB; // hexadecimal (171)

// float literals 

5.0; // common decimal float
5.; // omitted fractional (5.0)
.5; // omitted integral (0.5)
5e-1; // scientific notation (0.5) 
50%; // percent literal (0.5)
50.5%; // percent literal with fractional part (0.505)
:inf:; // infinity (case-insensitive)
:nan:; // NaN (case-insensitive)

// boolean

true;
false;

// none

none;

// bytes

:bytes:AB_AB; // bytes written in hexadecimal notation, "_" is optional separator, like in integers.