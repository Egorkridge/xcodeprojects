class Automobile {
    var brand: String
    var model: String
    var maxSpeed: Int
    init(brand:String, model:String, maxSpeed:Int){
        self.brand = brand
        self.model = model
        self.maxSpeed = maxSpeed
    }
    func printInfo() {
        print("Марка:\(brand), Модель:\(model), Максимальная скорость:\(maxSpeed)")
    }
}

class BMW: Automobile {
    var enginePower: Int
    init(brand:String, model:String, maxSpeed:Int, enginePower:Int){
        self.enginePower = enginePower
        super.init(brand: "BMW", model: model, maxSpeed: maxSpeed)
    }
    override func printInfo() {
        super.printInfo()
        print("Мощность двигателя: \(enginePower)")
    }
}

class Zeekr: Automobile {
    var fuelConsumption: Int
    init(brand:String, model:String, maxSpeed:Int, fuelConsumption:Int){
        self.fuelConsumption = fuelConsumption
        super.init(brand: "Zeekr", model: model, maxSpeed: maxSpeed)
    }
    override func printInfo() {
        super.printInfo()
        print("Расход топлива: \(fuelConsumption)")
    }
}

class Lada: Automobile {
    var from0to100: Int
    init(brand:String, model:String, maxSpeed:Int, from0to100:Int){
        self.from0to100 = from0to100
        super.init(brand: "Lada", model: model, maxSpeed: maxSpeed)
    }
    override func printInfo() {
        super.printInfo()
        print("разгон от 0 до 100: \(from0to100)")
    }
}

class Mercedes: Automobile {
    var year: Int
    init(brand:String, model:String, maxSpeed:Int, year:Int){
        self.year = year
        super.init(brand: "Mercedes", model: model, maxSpeed: maxSpeed)
    }
    override func printInfo() {
        super.printInfo()
        print("Год выпуска: \(year)")
    }
}

func createAuto(brand:String, model:String, maxSpeed:Int, typeAuto: String) -> Automobile {
    switch typeAuto {
    case "BMW":
        return BMW(brand: brand, model: model, maxSpeed: maxSpeed, enginePower: 635)
    case "Zeekr":
        return Zeekr(brand:brand, model:model, maxSpeed:maxSpeed,fuelConsumption: 30)
    case "Lada":
        return Lada(brand:brand, model:model, maxSpeed:maxSpeed, from0to100: 15)
    case "Mercedes":
        return Mercedes(brand:brand, model:model, maxSpeed:maxSpeed, year: 2002)
    default:
        return Automobile(brand:brand, model:model, maxSpeed:maxSpeed)
    }
}
func race(automobiles: [Automobile]) {
    guard automobiles.count % 2 == 0 else {
        print("Кол-во автомобилей должно быть четным")
        return
    }
    var winners: [Automobile] = []
    
    for i in stride(from: 0, to: automobiles.count, by: 2) {
        var auto1 = automobiles[i]
        var auto2 = automobiles[i + 1]
        if auto1.maxSpeed > auto2.maxSpeed {
            print("Победитель: \(auto1.brand) \(auto1.model)")
            winners.append(auto1)
        } else {
            print("Победитель: \(auto2.brand) \(auto2.model)")
            winners.append(auto2)
        }
    }
    if winners.count > 0 {
        let champion = winners[Int.random(in: 0..<winners.count)]
        print("Итоговый победитель: \(champion.brand)\(champion.model)")
    }
}

var automobiles = [
    createAuto(brand: "BMW", model: "M5", maxSpeed: 305, typeAuto: "BMW"),
    createAuto(brand: "Zeekr", model: "001", maxSpeed: 220, typeAuto: "Zeekr"),
    createAuto(brand: "Lada", model: "Vesta", maxSpeed: 172, typeAuto: "Lada"),
    createAuto(brand: "Mercedes", model: "W211", maxSpeed: 227, typeAuto: "Mercedes"),
    createAuto(brand: "BMW", model: "X3", maxSpeed: 252, typeAuto: "BMW"),
    createAuto(brand: "Lada", model: "Kalina", maxSpeed: 150, typeAuto: "Lada")
]

race(automobiles: automobiles)



