import UIKit

/*
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
*/

/*
isNumEven(number: 2)
isNumEven(number: 3)

isNumDivThree(number: 2)
isNumDivThree(number: 3)

var array = createArray()
delEvenFrom(array: &array)

let fibonacciNumbers = createFibonacсiNum()

let simpleNumbers = createSimpleNum(amount: 100)
simpleNumbers.count

//проверка числа на четность
func isNumEven(number: Int) -> Bool {

    return number % 2 == 0
    
}

//проверяем делится ли на 3
func isNumDivThree(number: Int) -> Bool {
    
      return number % 3 == 0

}

//создаем массив из 100 упорядоченных по возрастанию элементов
func createArray() -> [Int] {
    
    var array: [Int] = []
    
    for i in  0..<100 {
        
        array.append(i)
        
    }
    
    return array
    
}

//удалим все четные и те что не делятся на 3
func delEvenFrom(array: inout [Int]) {
    
    array = array.filter({
        
        ($0 % 2 != 0) && ($0 % 3 == 0)
        
    })
    
}

//создаем массив из первых 100 числе фибоначчи
func createFibonacсiNum() -> [Double] {
    
    var fibNum: [Double] = [1, 1]
    
    for i in 1..<99 {
        
        let newFibNum = fibNum[i] + fibNum[i - 1]
        fibNum.append(newFibNum)
        
    }
    
    return fibNum
    
}

//создаем массив простых чисел
func createSimpleNum(amount: Int) -> [Int] {
    
    var simpleNumbers: [Int] = [1 , 2, 3, 5, 7]
    
    var possibleSimpleNumber = 7
    
    nextNumber : while simpleNumbers.count < 100 {
        
        possibleSimpleNumber += 1
        
        for divider in 2..<possibleSimpleNumber {
            
            if possibleSimpleNumber % divider == 0 {
                continue nextNumber
            }
            
        }
        
        simpleNumbers.append(possibleSimpleNumber)
        
    }
    
    return simpleNumbers

}
*/
/*
//создаем массив простых чисел
func createSimpleNum() -> [Double] {
    
    var simpleNymbers: [Double] = []
    
    var numOfIteration: Int = 1
    var finish: Bool = false
    
    while !finish {
        
        var tempMass: [Bool] = []
          
        for _ in (100 * (numOfIteration - 1))..<(100 * numOfIteration) {
              
            tempMass.append(true)
              
        }
        
        for p in 2..<tempMass.count {
              
            if tempMass[p] {
                  
                for j in stride(from: p, to: tempMass.count, by: p) {
                      
                    tempMass[j] = false
                      
                }
                  
                tempMass[p] = true
                  
            }
        }
          
        for (i, element) in tempMass.enumerated() {
              
            if element == true {
                  
                simpleNymbers.append(Double(i))
                  
            }

            if simpleNymbers.count == 100 {
                
                finish = true
                break
                
            }

        }
        
        numOfIteration += 1
        
    }
        
    return simpleNymbers
    
}
*/


/*
 1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.
 */

enum Doors {
    
    case leftFront
    case rightFront
    case leftBack
    case rightBack
    
}

struct Car {
    
    init(model: String, yearOfIssue: Int) {
        
        self.model = model
        self.yearOfIssue = yearOfIssue
        
    }
    
    let model: String
    let yearOfIssue: Int
    
    var baggageSpace: Int?
    var power: Int?
    var amountOfLuggage: Int?
    var color: String?
    var isEngineSwitchOn: Bool = false
    
    private var openDoors: Set<Doors> = []
    
    var fullLuggageSpace: Int? {
        
        get {
            
            guard let baggageSpace = self.baggageSpace else {
        
                return nil
                
            }
            
            guard let amountOfLuggage = self.amountOfLuggage else {
                
                return self.baggageSpace
                
            }
            
            return baggageSpace - amountOfLuggage
            
        }
    }
        
    mutating func openDoor(door: Doors) {
        
        self.openDoors.insert(door)
        
    }
    
    mutating func closeDoor(door: Doors) {
        
        self.openDoors.remove(door)
        
    }
    
    mutating func swithOnEngine() {
        
        self.isEngineSwitchOn = true
        
    }
    
    mutating func swithOffEngine() {
        
        self.isEngineSwitchOn = false
        
    }
    
    func printinfo() -> String {
        
        return """
        Машина марки \(self.model).
        Цвет машины \(color ?? "Цвет не задан").
        Мощность двигателя: \(self.power ?? -1).
        Открытые двери: \(self.openDoors).
        \(isEngineSwitchOn ? "Двигатель включен." : "Двигатель выключен.")
        Свободное место в багажнике: \(self.fullLuggageSpace ?? -1)
        Объем багажника: \(self.baggageSpace ?? -1)
        """
    }
    
}

var bmw = Car(model: "bmw", yearOfIssue: 2020)
bmw.power = 360
bmw.openDoor(door: Doors.leftBack)

bmw.printinfo()
