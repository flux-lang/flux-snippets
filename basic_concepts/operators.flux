// vim: syntax=rust 


// operators, grouped by priority, sorted by priority, from highest to lowest

// type cast

x as String; 

// power 

x ** y; // raise x to power y [important: x ** y ** z == x ** (y ** z)]

// unary operators

-5; // unary minus
+5; // unary plus
~5; // bitwise inversion
@5; // prints 5 to stdout
>5; // prints 5 to stdout and reads a line from stdout, similar to Python's input(x)
%5.5; // rounds 5.5 to the nearest integer (which is 6)
?condition; // assert operator, along with 'assert condition' expression.
...x; // list unpack
..*x; // dictionary unpack

// multiplication, division, floor division and modulo

5 * 5; // 25, multiplication
5 / 4; // 1.25, division
5 /% 4; // 1, floor division
-5 /% 4; // -2
5 % 4; // 1, modulo
-5 % 4; // 3

// addition and subtraction

5 + 5; // 10
5 - 5; // 0

// comparison operators

10 > 5; // greater (true)
10 < 5; // less (false)
10 >= 5; // greater or equal (true)
10 <= 5; // less or equal (false)
10 == 5; // equal (false)
10 != 5; // not equal (true)

// bitwise and

5 & 3; // 1 

// bitwise or

5 | 3; // 7

// other bitwise

5 << 3; // left shift (40)
5 >> 3; // right shift (0)
5 ^ 3; // xor (6)

// logical not

!0; // true
not 0; // true

// logical and

5 && 10; // true
5 and 10; // true

// logical or

5 || 10; // true
5 or 10; // true

// logical xor (under consideration)

5 ^^ 10; // false
5 xor 10; // false

// assignment

let x = 5; // define x
const x = 5; // define const x
x = 5; // assign to x
// formats below can't be used with let or const
numbers[index] = 5; // index assignment
&x = 5; // assign to reference
&objects[index].names[0] = "Joe"; // mixed assign
[x, y] = [1, 2]; // list unpack assign

// compound assignment

// and every non-logical binary operator actually works here
x += 5; // add 5 to x
&x += 5; // add 5 to reference
