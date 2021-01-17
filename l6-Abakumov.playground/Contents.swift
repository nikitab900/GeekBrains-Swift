import UIKit

//func min<T: Equatable>(_ array: [T]) -> T {
//    var _min: T
    
//    for i in array {
//        if array[i] < min {
//            min = array[i]
//        }
//    }
    
//    return _min
//}



let min<T: Equatable>: (T, T) -> T = {(first: T, second: T) -> T in return (first < second ? first : second)}
// В данном коммите не смог разобраться как использовать замыкания с дженериками. Ниже есть структура, в которой я хотел определить метод, получающий замыкание как параметр. Но если в стуктуре я использую свободный тип, то я же не могу использовать типизированное замыкание. Хотел бы понять как это реализовать? Или такой подход вообще не уместен?




struct Queue<T: Equatable> {
    private var elements: [T] = []
    
    //func take()
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T?  {
        return elements.removeFirst()
    }
}

var queue = Queue<Int>()
queue.enqueue(33)
queue.enqueue(27)
print(queue)
print(queue.dequeue()!)
