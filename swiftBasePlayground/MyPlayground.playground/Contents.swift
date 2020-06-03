import UIKit

quadraticEquation(a: 1, b: 2, c: 1)

triangle(a: 5, b: 3.5)

func quadraticEquation(a: Double, b :Double, c: Double) {
    
    let discriminant = b * b - 4 * a * c
    
    if discriminant < 0 {
        print("Нет решений.")
        return
    }
    
    if discriminant == 0 {
        print("У уравнение единственноер решение, равное: \(-b / (2 * a))")
        return
    }
    
    print("x1 = \((-b + sqrt(discriminant)) / (2 * a)) ; x2 = \((-b - sqrt(discriminant)) / (2 * a))")
}

func triangle(a: Double, b: Double){
    
    let s = (a * b) / 2
    let hypotenuse = sqrt(a * a + b * b)
    let p = a + b + hypotenuse
    
    print("Площадь: \(s), периметр: \(p), гипотенуза: \(hypotenuse).")
}


