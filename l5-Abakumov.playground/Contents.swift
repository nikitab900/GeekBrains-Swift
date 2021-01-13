import UIKit

enum CarType: String {
    case SUV
    case cabrio
    case hatchBack
    case sedan
}

enum BikeType: String {
    case sport
    case enduro
    case cruiser
    case street
}

protocol Vehicle {
    var year: Int {get}
    var mass: Int {get}
    var isLaunched: Bool {get}
    
    func launch() -> Bool
    func stop()   -> Bool
}

class Car: Vehicle {
    var year: Int
    var mass: Int
    var isLaunched: Bool = false
    
    var model: String
    var type: CarType
    
    var isParkingState: Bool = true
    var isEngineOk: Bool = true
    
    func launch() -> Bool {
        if (self.isParkingState && self.isEngineOk && !self.isLaunched && self.isEngineOk) {
            self.isLaunched = true
            print("Двигатель автомобиля \(self.model) запущен")
            return self.isLaunched
        }
        else if (self.isLaunched) {
            print("Двигатель автомобиля \(self.model) уже был запущен ранее")
            return self.isLaunched
        }
        else {
            print("Невозможно запустить двигатель автомобиля \(self.model)")
            return self.isLaunched
        }
    }
    
    func stop() -> Bool {
        if (self.isParkingState && self.isLaunched) {
            self.isLaunched = false
            print("Двигатель автомобиля \(self.model) остановлен")
            return self.isLaunched
        }
        else if (!self.isLaunched) {
            print("Двигатель автомобиля \(self.model) уже был остановлен ранее")
            return self.isLaunched
        }
        else {
            print("Чтобы остановить двигатель автомобиля \(self.model) установите режим Парковка")
            return self.isLaunched
        }
    }
    
    init(year: Int, mass: Int, model: String, type: CarType)
    {
        self.year = year
        self.mass = mass
        self.model = model
        self.type = type
        
        print("Был создан автомобиль \(self.model)")
    }
}

var subaru = Car(year: 2018, mass: 1450, model: "Subaru WRX", type: .sedan)
subaru.launch()
subaru.isParkingState = false
subaru.stop()

extension Car: CustomStringConvertible {
    var description: String {
        return self.type.rawValue
    }
}

print("Тип кузова \(subaru.model) - \(subaru.description)")

print("")


class Bike: Vehicle {
    var year: Int
    var mass: Int
    var isLaunched: Bool = false
    
    var model: String
    var type: BikeType
    
    var isSideStepDown: Bool = true
    var isNeutralGear: Bool = true
    
    func launch() -> Bool {
        if (self.isSideStepDown && self.isNeutralGear && !self.isLaunched) {
            self.isLaunched = true
            print("Двигатель мотоцикла \(self.model) запущен")
            return self.isLaunched
        }
        else if (self.isLaunched) {
            print("Двигатель мотоцикла \(self.model) уже был запущен ранее")
            return self.isLaunched
        }
        else {
            print("Невозможно запустить двигатель мотоцикла \(self.model), проверьте подножку и нейтраль")
            return self.isLaunched
        }
    }
    
    func stop() -> Bool {
        if (self.isLaunched) {
            self.isLaunched = false
            print("Двигатель мотоцикла \(self.model) остановлен")
            return self.isLaunched
        }
        else {
            print("Двигатель мотоцикла \(self.model) уже был остановлен ранее")
            return self.isLaunched
        }
    }
    
    init(year: Int, mass: Int, model: String, type: BikeType)
    {
        self.year = year
        self.mass = mass
        self.model = model
        self.type = type
        
        print ("Был создан мотоцикл \(self.model)")
    }
}

var ducati = Bike(year: 2010, mass: 210, model: "Ducati Panigale", type: .sport)
ducati.isSideStepDown = false
ducati.launch()

extension Bike: CustomStringConvertible {
    var description: String {
        return String(self.mass)
    }
}


print("Масса мотоцикла \(ducati.model) - \(ducati.description) киллограммов")
