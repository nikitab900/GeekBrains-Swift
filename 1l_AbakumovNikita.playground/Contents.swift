import UIKit

print("Задание 1. Квадратное уравнение")
//a * x1^2 + b * x2 + c = 0
let a:Double = 1
let b:Double = -6
let c:Double = 1
var d:Double = pow(b, 2) - 4 * a * c
var x1:Double
var x2:Double

print("При A = \(a), B = \(b) и C = \(c)")

if d < 0
{
    print("Уравнение не имеет корней")
}else if d == 0
{
    print("x1 = x2 = \(String(format: "%.2f", ((-1) * (b / 2 * a))))")
}else
{
    print("x1 = \(String(format: "%.2f", (((-1) * b - sqrt(pow(b, 2) - 4 * a * c)) / 2 * a)))")
    print("x2 = \(String(format: "%.2f", (((-1) * b + sqrt(pow(b, 2) - 4 * a * c)) / 2 * a)))")
}


print("\nЗадание 2. Площадь, гипотенуза и периметр прямоугольного треугольника")
let k1:Double = 4.21
let k2:Double = 3.82
var g:Double = sqrt(pow(k1, 2) + pow(k2, 2))
var s:Double = (k1 * k2) / 2
var p:Double = k1 + k2 + g

print("Катет 1 равен \(String(format: "%.2f", k1))")
print("Катет 2 равен \(String(format: "%.2f", k2))")
print("Гипотенуза равна \(String(format: "%.2f", g))")
print("Площадь равна \(String(format: "%.2f", s))")
print("Периметр равен \(String(format: "%.2f", p))")


print("\nЗадание 3. Проценты по вкладу (ежегодная капитализация)")
let deposit:Int   = 1000
let years:Int     = 5
let percent:Float = 4
var sum:Float = Float(deposit)

for i in 0..<years
{
    sum += (sum * percent) / 100
}

print("Сумма вклада через \(years) лет будет равна \(String(format: "%.2f", sum))")

