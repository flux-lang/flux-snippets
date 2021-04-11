// vim: syntax=rust 

/*

vector class example
this example shows opfn examples, class usage and initialization

*/

const Arithmetic = Union[Vector, Float];


class Vector {
    values as List[Arithmetic]; 
    length as Float;
    k as Float;

    init(self, ...values as List[Arithmetic]) {
        if not length(values) {
            values = [.0, .0]; // falling back to 2-dimensional zero-vector
        };
        self.values = values;
    };

    // static method as no self
    fn from_number(num as Float, dimensions as U8 = 2) as Vector {
        Vector(
            [num for _ in -> dimensions]
        )
    };

    get length(self) {
        sum(
            map(
                self.values, 
                fn(x) -> x ** 2
            )
        ) ** 0.5
    };

    fn normalize(self) as Vector {
        self / self.length
    };

    opfn self[index as U8] as Arithmetic {
        self.values[index]
    };

    opfn self[index as Range] as Vector {
        Vector(self.values[index])
    }

    // standard function
    sfn iter(self) as Iterator[Arithmetic] {
        self.values.iter()
    };

    sfn length(self) {
        length(self.values)
    }

    opfn -self as Vector {
        Vector([-n for n in self])
    };

    /*
    
    That's the algorithm for vector operations I used in soda and it was really nice to use.

    For every index of self, get other[index % length(other)] and perform operation on those two.
    The result is added as new[index]

    Examples (vec[...] is just a simplified written form of Vector([...])):

    vec[10, 20] + vec[10] -> vec[20, 30]
    vec[100, 80] * vec[2, 1] -> vec[200, 80]
    vec[1, 2] + vec[1, 2, 3, 4] -> vec[2, 4]
    vec[1, 2, 3, 4] + vec[1, 2] -> vec[2, 4, 4, 6]

    */
    fn operation(self, other as Vector, op_func as Function) as Vector {
        new_values as List[Arithmetic] = [];
        for i in -> length(self.values) {
            new_values.add(
                op_func(
                    self[i], 
                    other[i % length(other)]
                )
            )
        };
        Vector(new_values)
    };

    // i think there could be something like python's operator module in flux std
    // to implement it with less code 

    opfn self + other as Vector {
        self.operation(
            other,
            fn(x, y) -> x + y
        )
    };

    opfn self - other as Vector {
        self.operation(
            other,
            fn(x, y) -> x - y
        )
    };

    opfn self * other as Vector {
        self.operation(
            other,
            fn(x, y) -> x * y
        )
    };

    opfn self + other as Vector {
        self.operation(
            other,
            fn(x, y) -> x / y
        )
    };

    opfn self % other as Vector {
        self.operation(
            other,
            fn(x, y) -> x % y
        )
    };

    opfn self /% other as Vector {
        self.operation(
            other,
            fn(x, y) -> x /% y
        )
    };

    opfn self ** other as Vector {
        self.operation(
            other,
            fn(x, y) -> x ** y
        )
    };

    // method for floats: Vector([2, 10]) + 6 == Vector([8, 16])
    opfn self + other as Float {
        self + Vector.from_number(other)
    };

    opfn self - other as Float {
        self - Vector.from_number(other)
    };

    opfn self * other as Float {
        self * Vector.from_number(other)
    };

    opfn self / other as Float {
        self / Vector.from_number(other)
    };

    opfn self % other as Float {
        self % Vector.from_number(other)
    };

    opfn self /% other as Float {
        self /% Vector.from_number(other)
    };

    // reverse operation (like in 6 + Vector(), when 6 "doesn't know" how to add a vector to itself)
    opfn other as Float + self {
        self + other
    };

    opfn other as Float + self {
        Vector.from_number(other) - self 
    };

    opfn other as Float * self {
        self * other
    };

    opfn other as Float / self {
        Vector.from_number(other) / self 
    };

    opfn other as Float % self {
        Vector.from_number(other) % self 
    };

    opfn other as Float /% self {
        Vector.from_number(other) /% self 
    };

    opfn other as Float ** self {
        Vector.from_number(other) ** self 
    };

};


pub Vector; // making Vector class public so other files can use it 