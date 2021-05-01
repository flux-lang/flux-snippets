// vim: syntax=rust 

/*

Generating Bezier curve approximations for given points and precision.

Similar algorithm is used in https://codepen.io/evtn/pen/ExZboZx

*/



import Vector from vector; // vector.flux


class SimpleBezier {
    points as List[Vector];

    init(self, points as List[Vector]) {
        self.points = points;
    };

    fn bezier(self, precision as U32 = 100) as List[Vector] {
        [self.getPoint(self.points, i as Float / precision) for i in ->> precision]
    };

    fn getPoint(self, points as List[Vector], k as Float) as Vector {
        if length(points) == 1 {
            points[0]
        } else {
            getPoint(
                map(
                    fn(i) -> self.interpolate(controls[i], controls[i + 1], k),
                    Range(length(controls) - 1),
                ) as List,
                k
            )
        }
    };

    fn interpolate(start as Vector, end as Vector, k as Float) {
        start * (1 - k) + end * k
    };
};


// this class uses nested vector
fn bezier(points as Vector, k as Float) {
    if length(points) == 1 {
        points[0]
    } else {
        bezier(
            points[-> -1] * k + points[1 ->] * (1 - k),
            k
        )
    }
}


