// vim: syntax=rust 

/*

Generating Bezier curve approximations for given points and precision.

Similar algorithm is used in https://codepen.io/evtn/pen/ExZboZx

*/



import Vector from vector; // vector.flux


fn bezier(points as List[Vector], precision as U32 = 100) as List[Vector] {
    [getPoint(points, i as Float / precision) for i in ->> precision]
};


fn getPoint(points as List[Vector], k as Float) as Vector {
    if length(points) == 1 {
        points[0]
    } else {
        getPoint(
            map(
                Range(length(controls) - 1),
                fn(i) -> interpolate(controls[i], controls[i + 1], k)
            ) as List,
            k
        )
    }
};


fn interpolate(start as Vector, end as Vector, k as Float) {
    start * (1 - k) + end * k
};