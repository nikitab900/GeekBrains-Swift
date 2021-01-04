import UIKit

//Типы спорткаров
enum SportCarType {
    case coupe
    case roadster
}

//Типы грузовиков
enum TrunkCarType {
    case tracktor
    case dump
}

//Состояние двигателя
enum EngineState {
    case started
    case stoped
}

// Состояние двери
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

//Состояние дверей
struct Doors {
    var left:DoorState
    var right:DoorState
}

//Состояние антикрыла спортивного автомобиля
enum WingState {
    case up
    case down
}


class Car {
    var model:String
    var year:Int
    var color:UIColor
    var weight:Int
    var actualSpeed = 0
    var doors = Doors(left: DoorState.close, right: DoorState.close)
    var engineState = EngineState.stoped
    
    func engineStart() {
        self.engineState = .started
        print("Двигатель запущен")
    }
    
    func engineStop() {
        self.engineState = .stoped
        print("Двигатель остановлен")
    }
    
    func isReady() -> Bool {
        return (self.doors.left == .close && self.doors.right == .close && self.engineState == .stoped)
    }
    
    init (model:String, year:Int, color:UIColor, weight:Int) {
        self.model = model
        self.year = year
        self.color = color
        self.weight = weight
    }
}

//Подкласс спортивных авто
class SportCar : Car {
    var maxSpeed: Int
    var type: SportCarType
    var wingState: WingState {
        if super.actualSpeed > (self.maxSpeed / 2) {
            print("Спойлер поднят")
            return .up
        } else {
            print("Спойлер опущен")
            return .down
        }
    }
    
    override func isReady() -> Bool {
        return (self.doors.left == .close && self.doors.right == .close)
    }
    
    init(model: String, year: Int, color: UIColor, weight: Int, maxSpeed: Int, type: SportCarType) {
        self.maxSpeed = maxSpeed
        self.type = type
        super.init(model: model, year: year, color: color, weight: weight)
    }
}

var lambo = SportCar(model: "Lamborghini", year: 2008, color: UIColor.green, weight: 1300, maxSpeed: 250, type: .roadster)

lambo.actualSpeed = 100
lambo.wingState
lambo.doors.left = .open

if (lambo.isReady()) {
    print("Авто готов")
} else {
    print("Авто не готов")
}

//Подкласс грузовиков
class TrunkCar : Car {
    var load = 0
    let maxLoad: Int
    var type: TrunkCarType
    
    func putIn(load: Int) -> (Int) {
        guard load < maxLoad else {
            print("Недостаточно места")
            return self.load
        }
        self.load += load
        return self.load
    }
    
    func putOut(load: Int) -> (Int) {
        guard load > self.load else {
            print("Недостаточно груза для выгрузки")
            return self.load
        }
        self.load -= load
        return self.load
    }
    
    override func isReady() -> Bool {
        return (self.doors.left == .close && self.doors.right == .close && self.load == 0)
    }
    
    init(model: String, year: Int, color: UIColor, weight: Int, type: TrunkCarType, maxLoad: Int) {
        self.type = type
        self.maxLoad = maxLoad
        super.init(model: model, year: year, color: color, weight: weight)
    }
}

var volvo = TrunkCar(model: "Volvo", year: 2010, color: UIColor.black, weight: 4500, type: .dump, maxLoad: 8000)
print(volvo.load)
print(volvo.putIn(load: 5000))
