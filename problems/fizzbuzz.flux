// vim: syntax=rust 

/*

Print integers 1 to N, 
but print “Fizz” if an integer is divisible by 3, 
“Buzz” if an integer is divisible by 5, 
and “FizzBuzz” if an integer is divisible by both 3 and 5.

*/ 

// straightworward implementation
fn fizzbuzz(n as U128) {
    for i in 1 ->> n { // inclusive range with ->>
        @{ // @ is unary print operator
            if (i % 5 && i % 3) {
                i as String
            } else {
                let buf as List[String] = [];
                if !(i % 3) {
                    buf.add("Fizz")
                };
                if !(i % 5) {
                    buf.add("Buzz")
                };
                // String.join() (Python-like) is not so obvious and List.join is restrictive - any iterable can be joined if it yields strings
                join(buf, "") 
            }
        }
    };
}

// short and barely readable
fn fizzbuzz_short(n as U128)->for i in 1->>n{@(("Fizz".repeat(!i%3)+"Buzz".repeat(!i%5))||i);};
