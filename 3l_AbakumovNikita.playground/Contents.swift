import UIKit

//Состояние двери
enum DoorState{
    case open
    case close
}

//Сторона двери
enum DoorSide
{
    case left
    case right
}

//Состояние двигателя
enum EngineState{
    case lunched
    case stopped
    case emer
}

//Состояние багажника/кузова
enum BaggageState{
    case full
    case empty
    case notEmpty
}

struct Doors {
    var left:DoorState
    var right:DoorState
}

//Описание спортивного автомобиля
struct SportCar{
    var model:String
    var year:Int
    var color:UIColor
    let baggageMaxValue:Int
    var baggageValue:Int = 0
    var maxSpeed:Int
    var doors = Doors(left: DoorState.close, right: DoorState.close)
    var engineIs = EngineState.stopped
    
    //Изменение состояния двери
    mutating func changeDoorState(state:DoorState, side:DoorSide) -> ()
    {
        switch side{
            case .left:
                doors.left = state
                break
            case .right:
                doors.right = state
                break;
        }
        
        print("\(side) door is \(state)")
    }
    
    //Запуск двигателя
    mutating func startEngine() -> ()
    {
        if (engineIs != .emer){
            engineIs = .lunched
            print("Двигатель запущен")
        }else{
            print("Невозможно запустить двигатель. Аварийное состояние")
        }
    }
    
    //Остановка двигателя
    mutating func stopEngine() -> ()
    {
        engineIs = .stopped
        print("Двигатель остановлен")
    }
    
    //Добавление груза в багажник
    mutating func addToBaggage(cargo:Int) -> (Int)
    {
        guard ((cargo + self.baggageValue) <= self.baggageMaxValue)  else {
            print("Не достаточно места для данного груза")
            return self.baggageValue
        }
        
        self.baggageValue += abs(cargo) //конвертируем число в положительное, если пользователь ввел отрицательное
        print("В багажном отделении сейчас \(self.baggageValue) груза")
        return self.baggageValue
    }
    
    //Убрать груз из багажника
    mutating func takeOfBaggage(cargo:Int) -> (Int)
    {
        guard ((self.baggageValue - cargo) > 0)  else {
            print("Нет столько груза в багажнике")
            return self.baggageValue
        }
        
        self.baggageValue -= abs(cargo) //конвертируем число в положительное, если пользователь ввел отрицательное
        print("В багажном отделении сейчас \(self.baggageValue) груза")
        return self.baggageValue
    }
    
    func getBaggageState() -> (BaggageState)
    {
        if (self.baggageValue > 0 && self.baggageValue < self.baggageMaxValue){
            return .notEmpty
        }
        else if (self.baggageValue == 0){
            return .empty
        }
        else{
            return .full
        }
    }
}

var koenigsegg = SportCar(model: "Koenigsegg", year: 2018, color: UIColor.darkGray, baggageMaxValue: 100, maxSpeed: 300)
print("Сейчас багажник \(koenigsegg.getBaggageState())")
koenigsegg.addToBaggage(cargo: 10)
print("Сейчас багажник \(koenigsegg.getBaggageState())")
koenigsegg.changeDoorState(state: DoorState.open, side: DoorSide.left)
koenigsegg.startEngine()
koenigsegg.addToBaggage(cargo: 100)
print("Сейчас багажник \(koenigsegg.getBaggageState())")
koenigsegg.stopEngine()

print("\n\n")

var porsche = SportCar(model: "Porsche", year: 2001, color: UIColor.green, baggageMaxValue: 160, maxSpeed: 260)
print("Сейчас багажник \(porsche.getBaggageState())")
porsche.addToBaggage(cargo: 40)
print("Сейчас багажник \(porsche.getBaggageState())")
porsche.changeDoorState(state: DoorState.open, side: DoorSide.left)
porsche.startEngine()
porsche.addToBaggage(cargo: 100)
print("Сейчас багажник \(porsche.getBaggageState())")
porsche.stopEngine()

print("\n\n")

//Описание грузового автомобиля
struct TruckCar{
    var model:String
    var year:Int
    var color:UIColor
    let baggageMaxValue:Int
    var baggageValue:Int = 0
    var doors = Doors(left: DoorState.close, right: DoorState.close)
    var engineIs = EngineState.stopped
    
    //Изменение состояния двери
    mutating func changeDoorState(state:DoorState, side:DoorSide) -> ()
    {
        switch side{
            case .left:
                doors.left = state
                break
            case .right:
                doors.right = state
                break;
        }
        
        print("\(side) door is \(state)")
    }
    
    //Запуск двигателя
    mutating func startEngine() -> ()
    {
        if (engineIs != .emer){
            engineIs = .lunched
            print("Двигатель запущен")
        }else{
            print("Невозможно запустить двигатель. Аварийное состояние")
        }
    }
    
    //Остановка двигателя
    mutating func stopEngine() -> ()
    {
        engineIs = .stopped
        print("Двигатель остановлен")
    }
    
    //Добавление груза в багажник
    mutating func addToBaggage(cargo:Int) -> (Int)
    {
        guard ((cargo + self.baggageValue) <= self.baggageMaxValue)  else {
            print("Не достаточно места для данного груза")
            return self.baggageValue
        }
        
        self.baggageValue += abs(cargo) //конвертируем число в положительное, если пользователь ввел отрицательное
        print("В багажном отделении сейчас \(self.baggageValue) груза")
        return self.baggageValue
    }
    
    //Убрать груз из багажника
    mutating func takeOfBaggage(cargo:Int) -> (Int)
    {
        guard ((self.baggageValue - cargo) > 0)  else {
            print("Нет столько груза в багажнике")
            return self.baggageValue
        }
        
        self.baggageValue -= abs(cargo) //конвертируем число в положительное, если пользователь ввел отрицательное
        print("В багажном отделении сейчас \(self.baggageValue) груза")
        return self.baggageValue
    }
    
    func getBaggageState() -> (BaggageState)
    {
        if (self.baggageValue > 0 && self.baggageValue < self.baggageMaxValue){
            return .notEmpty
        }
        else if (self.baggageValue == 0){
            return .empty
        }
        else{
            return .full
        }
    }
    
    //Разгрузить весь груз
    mutating func takeOfAllBaggage() -> ()
    {
        let _last = self.baggageValue
        
        guard self.baggageValue > 0 else {
            print("Кузов пуст")
            return
        }
        self.baggageValue = 0
        print("Груз \(_last) был полностью разгружен")
    }
}


var ford = TruckCar(model: "Ford", year: 1999, color: UIColor.black, baggageMaxValue: 1000)
ford.addToBaggage(cargo: 800)
ford.addToBaggage(cargo: 50)
ford.takeOfAllBaggage()

print("\n\n")

var volvo = TruckCar(model: "Volvo", year: 2007, color: UIColor.red, baggageMaxValue: 1500)
volvo.addToBaggage(cargo: 500)
print("Кузов \(volvo.model) \(volvo.getBaggageState())")
volvo.addToBaggage(cargo: 1900)
volvo.takeOfAllBaggage()
