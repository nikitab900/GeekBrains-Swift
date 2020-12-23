import UIKit

//Определение четного числа
func isEven(number:Int) -> Bool
{
    return (number % 2 == 0 ? true : false)
}

print(isEven(number: 9979877))


//Делится ли число на 3 без остатка
func isDevBy3(number:Int) -> Bool
{
    return (number % 3 == 0 ? true : false)
}

print(isDevBy3(number: 28))



//Возрастающий массив из 100 чисел
var upArr:[Int] = []
for i in 0...99
{
    upArr.append(i);
}
print(upArr)


//Удаляем из массива четные числа и числа, делящиеся на 3
for i in upArr.reversed()
{
    if (isEven(number: upArr[i]) || isDevBy3(number: upArr[i]))
    {
        upArr.remove(at: i)
    }
}
print(upArr)


//Функция добавления числа Фибоначи
var fibArr:[Int] = [3, 5]
print(fibArr)
func addFib(arr: inout [Int])
{
    var fib:Int
    
    if (arr.count == 0)
    {
        fib = 0
    }
    else if (arr.count == 1)
    {
        fib = arr[0]
    }
    else
    {
        fib = (arr[arr.count - 1] + arr[arr.count - 2])
    }
    
    arr.append(fib)
}

for _ in 0...50
{
    addFib(arr: &fibArr)
}
print(fibArr)
