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
/*
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
*/


/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.
*/

/*
class Automobile {
    
    enum Doors {
        case leftFrontDoor,rightFrontDoor,backLeftDoor,backRightDoor,BaggageDoor
    }
    enum Colors {
     case black,white,red,green,purple,yelow
    }
    
    private let model: String
    private let yearOfIssue: Int
    
    var baggageSpace: Int {
        didSet{
            print("Объем багажника увеличен на \(baggageSpace - oldValue)")
        }
    }
    var power: Int {
        didSet{
            print("Мощность увеличена на \(power - oldValue)")
        }
    }
    
    private var color: Colors {
        didSet{
            print("Цвет изменес с \(oldValue) на \(color)")
        }
    }
    private var amountOfLuggage: Int = 0 {
        didSet{
            print("В багажник положен груз объемом \(amountOfLuggage - oldValue)")
        }
    }
    private var isEngineSwitchOn: Bool = false {
        didSet {
            if isEngineSwitchOn {
                print("Двигатель запущен.")
            } else {
                print("Двигатель остановлен.")
            }
        }
    }
    
    var freeSpase: Int {
        baggageSpace - amountOfLuggage
    }
   
    private var openDoors: Set<Doors> = []
    
    init(model: String, yearOfIssue: Int, baggageSpace: Int, power: Int, color: Colors) {
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.baggageSpace = baggageSpace
        self.power = power
        self.color = color
    }
    
    func startEngine() {
        isEngineSwitchOn = true
    }
    
    func stopEngine() {
        isEngineSwitchOn = false
    }
    
    func putLuggage(luggage: Int) {
        if freeSpase > luggage {
            self.amountOfLuggage += luggage
        } else {
            print("В багажнике не хватает места.")
        }
    }
    
    func increaseBaggageSpaceOn(space: Int) {
        baggageSpace = baggageSpace + space
    }
    
    func increasePowerOn(power: Int) {
        self.power = power
    }
    
    func changeColorOn(color: Colors) {
        self.color = color
    }
    
    func openDoor(door: Doors) {
        openDoors.insert(door)
    }
    
    func closeDoor(door: Doors) {
        openDoors.remove(door)
    }
    
    func info() -> String {
        return """
        цвет: \(color)
        мощность: \(power)
        объем багажника: \(baggageSpace)
        модель: \(model)
        год выпуска: \(yearOfIssue)
        объем груза: \(amountOfLuggage)
        открытые двери: \(openDoors)
        """
    }
}


class Truck : Automobile {
    
    enum Doors {
        case leftDoor,rightDoor,baggageDoor
    }

    var isFlatBedUp: Bool = false {
        didSet {
            if isFlatBedUp {
                print("Кузов поднят.")
            } else {
                print("Кузов опущен.")
            }
        }
    }
    
    override func increasePowerOn(power: Int) {
        if (self.power + power) < 200 {
            super.increasePowerOn(power: power)
        } else {
            print("Грузовик так не поедет.")
        }
    }
    
    func upFlatBed() {
        isFlatBedUp = true
    }
    
    func downFlatBed() {
        isFlatBedUp = false
    }
    
    override func info() -> String {
        return """
        \(super.info())
        кузов поднят: \(isFlatBedUp)
        """
    }
}

class Car : Automobile {
        
    private var isLukeOpen: Bool = false {
        didSet {
            if isLukeOpen {
                print("Люк открыт.")
            } else {
                print("Люк закрыт.")
            }
        }
    }
    private var isSpoilerExist = false {
        didSet {
            if isSpoilerExist {
                print("Спойлер установлен.")
            } else {
                print("Спойлер снят.")
            }
        }
    }
    
    override func increaseBaggageSpaceOn(space: Int) {
        if (baggageSpace + space) < 200 {
            super.increaseBaggageSpaceOn(space: space)
        } else {
            print("Не надо так. Лучше купи грузовик.")
        }
    }
    
    func putSpoiler() {
        isSpoilerExist = true
    }
    
    func deleteSpoiler() {
        isSpoilerExist = false
    }
    
    func openLuke() {
        isLukeOpen = true
    }
    
    func closeLuke() {
        isLukeOpen = false
    }
    
    override func info() -> String {
        return """
        \(super.info())
        люк открыт: \(isLukeOpen)
        спойлер установлен: \(isSpoilerExist)
        """
    }
}

let bmw: Car = Car(model: "bmw", yearOfIssue: 2000, baggageSpace: 60, power: 360, color: Automobile.Colors.black)
bmw.openDoor(door: Automobile.Doors.backRightDoor)
bmw.putSpoiler()
bmw.info()


let truck: Truck = Truck(model: "qwe", yearOfIssue: 2019, baggageSpace: 1000, power: 300, color: Automobile.Colors.white)
truck.upFlatBed()
truck.increasePowerOn(power: 23)
truck.startEngine()
truck.freeSpase
truck.info()
*/

/*
1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести сами объекты в консоль.
*/

/*
enum Doors {
    case leftFrontDoor,rightFrontDoor,backLeftDoor,backRightDoor,BaggageDoor
}

enum Colors {
 case black,white,red,green,purple,yelow
}

protocol Automobile {
        
    var model: String { get }
    
    var yearOfIssue: Int { get }
    
    var baggageSpace: Int { get set }
    
    var power: Int { get set }
    
    var color: Colors { get set }
    
    var amountOfLuggage: Int { get set }
    
    var isEngineSwitchOn: Bool { get set }
    
    var freeSpase: Int { get }
    
    var openDoors: Set<Doors> { get set }
    
    init(model: String, yearOfIssue: Int, baggageSpace: Int, power: Int, color: Colors)
    
    mutating func startEngine()
    mutating func stopEngine()
    
    mutating func putLuggage(luggage: Int)
    mutating func increaseBaggageSpaceOn(space: Int)
    
    mutating func openDoor(door: Doors)
    mutating func closeDoor(door: Doors)
    
    mutating func increasePowerOn(power: Int)
    
    mutating func changeColorOn(color: Colors)
}

extension Automobile {
    mutating func startEngine() {
        guard !isEngineSwitchOn else {
            print("Двигатель уже запущен.")
            return
        }
        isEngineSwitchOn = true
    }
      
    mutating func stopEngine() {
        guard isEngineSwitchOn else {
            print("Двигатель и так не работает.")
            return
        }
        isEngineSwitchOn = false
    }
}

extension Automobile {
    mutating func putLuggage(luggage: Int) {
        if freeSpase > luggage {
            self.amountOfLuggage += luggage
        } else {
            print("В багажнике не хватает места.")
        }
    }
    
    mutating func increaseBaggageSpaceOn(space: Int) {
        baggageSpace = baggageSpace + space
    }
}

extension Automobile {
    mutating func openDoor(door: Doors) {
        guard !openDoors.contains(door) else {
            print("Дверь уже открыта.")
            return
        }
        openDoors.insert(door)
    }

    mutating func closeDoor(door: Doors) {
        guard openDoors.contains(door) else {
            print("Дверь уже закрыта.")
            return
        }
        openDoors.remove(door)
    }
}

extension Automobile {
    mutating func increasePowerOn(power: Int) {
        self.power = power
    }
}

extension Automobile {
    mutating func changeColorOn(color: Colors) {
        self.color = color
    }
}


//реализация грузовика
protocol TruckFlatBedOptions {
    var isFlatBedUp: Bool { get set }
    
    func upFlatBed()
    func downFlatBed()
}

class Truck : Automobile {
    var model: String
       
    var yearOfIssue: Int
    
    var baggageSpace: Int {
        didSet{
            print("Объем багажника увеличен на \(baggageSpace - oldValue)")
        }
    }
    
    var power: Int {
        didSet{
            print("Мощность увеличена на \(power - oldValue)")
        }
    }
     
    internal var color: Colors {
         didSet{
             print("Цвет изменес с \(oldValue) на \(color)")
         }
     }
    
    internal var amountOfLuggage: Int = 0 {
         didSet{
             print("В багажник положен груз объемом \(amountOfLuggage - oldValue)")
         }
     }
    
    internal var isEngineSwitchOn: Bool = false {
         didSet {
             if isEngineSwitchOn {
                 print("Двигатель запущен.")
             } else {
                 print("Двигатель остановлен.")
             }
         }
     }
     
    var freeSpase: Int {
        baggageSpace - amountOfLuggage
    }
    
    var openDoors: Set<Doors> = []
    
    var isFlatBedUp: Bool = false {
        didSet {
            if isFlatBedUp {
                print("Кузов поднят.")
            } else {
                print("Кузов опущен.")
            }
        }
    }
    
    required init(model: String, yearOfIssue: Int, baggageSpace: Int, power: Int, color: Colors) {
          self.model = model
          self.yearOfIssue = yearOfIssue
          self.baggageSpace = baggageSpace
          self.power = power
          self.color = color
      }

    func increasePowerOn(power: Int) {
        if (self.power + power) < 200 {
            self.power += power
        } else {
            print("Грузовик так не поедет.")
        }
    }
    
}

extension Truck: TruckFlatBedOptions {
    func upFlatBed() {
        guard !isFlatBedUp else {
            print("Кузов уже поднят.")
            return
        }
        isFlatBedUp = true
    }
    
    func downFlatBed() {
        guard isFlatBedUp else {
            print("Кузов уже опущен.")
            return
        }
        isFlatBedUp = false
    }
}

extension Truck: CustomStringConvertible {
    var description: String {
        return """
        цвет: \(color) \n
        мощность: \(power) \n
        объем багажника: \(baggageSpace) \n
        модель: \(model) \n
        год выпуска: \(yearOfIssue) \n
        объем груза: \(amountOfLuggage) \n
        открытые двери: \(openDoors) \n
        свободного места в бвгажнике: \(freeSpase) \n
        поднят ли кузов: \(isFlatBedUp)
        """
    }
}

//реализация спорткара
protocol SportCarLukeOptions {
    var isLukeOpen: Bool { get set }
    
    func openLuke()
    func closeLuke()
}

protocol SportCarSpoilerOptions {
    var isSpoilerExist: Bool { get set }
    
    func putSpoiler()
    func deleteSpoiler()
}

class SportCar : Automobile {
    var model: String
       
    var yearOfIssue: Int
    
    var baggageSpace: Int {
        didSet{
            print("Объем багажника увеличен на \(baggageSpace - oldValue)")
        }
    }
    
    var power: Int {
        didSet{
            print("Мощность увеличена на \(power - oldValue)")
        }
    }
     
    internal var color: Colors {
         didSet{
             print("Цвет изменес с \(oldValue) на \(color)")
         }
     }
    
    internal var amountOfLuggage: Int = 0 {
         didSet{
             print("В багажник положен груз объемом \(amountOfLuggage - oldValue)")
         }
     }
    
    internal var isEngineSwitchOn: Bool = false {
         didSet {
             if isEngineSwitchOn {
                 print("Двигатель запущен.")
             } else {
                 print("Двигатель остановлен.")
             }
         }
     }
     
    var freeSpase: Int {
        baggageSpace - amountOfLuggage
    }
    
    var openDoors: Set<Doors> = []

    internal var isLukeOpen: Bool = false {
        didSet {
            if isLukeOpen {
                print("Люк открыт.")
            } else {
                print("Люк закрыт.")
            }
        }
    }
    
    internal var isSpoilerExist: Bool = false {
        didSet {
            if isSpoilerExist {
                print("Спойлер установлен.")
            } else {
                print("Спойлер снят.")
            }
        }
    }

    required init(model: String, yearOfIssue: Int, baggageSpace: Int, power: Int, color: Colors) {
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.baggageSpace = baggageSpace
        self.power = power
        self.color = color
    }
        
    func increaseBaggageSpaceOn(space: Int) {
        if (baggageSpace + space) < 200 {
            baggageSpace += space
        } else {
            print("Не надо так. Лучше купи грузовик.")
        }
    }
}
    
extension SportCar: SportCarSpoilerOptions {
    func putSpoiler() {
        guard !isSpoilerExist else {
            print("Уже установлен.")
            return
        }
        isSpoilerExist = true
    }
    
    func deleteSpoiler() {
        guard isSpoilerExist else {
            print("Спойлера и не было.")
            return
        }
        isSpoilerExist = false
    }
}

extension SportCar: SportCarLukeOptions {
    func openLuke() {
        guard !isLukeOpen else {
            print("Люк уже открыт.")
            return
        }
        isLukeOpen = true
    }
    
    func closeLuke() {
        guard isLukeOpen else {
            print("Люк уже закрыт.")
            return
        }
        isLukeOpen = false
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return """
        цвет: \(color) \n
        мощность: \(power) \n
        объем багажника: \(baggageSpace) \n
        модель: \(model) \n
        год выпуска: \(yearOfIssue) \n
        объем груза: \(amountOfLuggage) \n
        открытые двери: \(openDoors) \n
        установлен ли спойлер: \(isSpoilerExist) \n
        открыт ли люк: \(isLukeOpen)
        """
    }
}

var sportCar = SportCar(model: "bmw", yearOfIssue: 2020, baggageSpace: 300, power: 4000, color: Colors.black)
sportCar.putLuggage(luggage: 30)
sportCar.putSpoiler()
sportCar.openLuke()
sportCar.openDoor(door: Doors.backLeftDoor)
sportCar.increaseBaggageSpaceOn(space: 23)

print()
print(sportCar)

print()
print()
print()
print()


var truck = Truck(model: "mersedes", yearOfIssue: 1999, baggageSpace: 10000, power: 100, color: Colors.green)
truck.downFlatBed()
truck.startEngine()

print()
print(truck)
 */

/*
1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

/*
protocol Container {
    associatedtype T
    
    func size() -> Int
    func empty() -> Bool
    mutating func push(elem: T)
    mutating func pop(elem: T) -> T
}

protocol FilteredContainer: Container {
    func filter(_ expression: (T) -> Bool) -> [T]
}

protocol ForEachActionContainer : Container {
    func forEach(_ expression: (T) -> (T)) -> [T]
}

struct Queue<T>: Container {
    private var queueList: [T]
    
    init() {
        queueList = []
    }
    
    init(_ list: [T]){
        queueList = list
    }
    
    func size() -> Int {
        return queueList.count
    }
    
    func empty() -> Bool {
        return queueList.isEmpty
    }
    
    mutating func push(elem: T) {
        queueList.append(elem)
    }
    
    mutating func pop(elem: T) -> T{
        return queueList.removeLast()
    }
}

extension Queue: FilteredContainer {
    func filter(_ expression: (T) -> Bool)  -> [T] {
        return queueList.filter(expression)
    }
}

extension Queue: ForEachActionContainer {
    func forEach<U>(_ expression: (T) -> U) -> [U] {
        var newQueue = [U]()
        for elem in queueList {
            newQueue.append(expression(elem))
        }
        return newQueue
    }
}

extension Queue {
    subscript (index: Int) -> T? {
        if index < queueList.count , index >= 0 {
            return queueList[index]
        } else {
            return nil
        }
    }
}

var queue: Queue = Queue([2, 4, 6, 8, 9, 11])
queue[3]
queue.push(elem: 15)
queue[20]
print(queue)
queue.filter(){
    $0 % 2 == 0
}
*/

/*
 1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
 2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.
 */

