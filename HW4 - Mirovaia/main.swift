//
//  main.swift
//  HW4 - Mirovaia
//
//  Created by Christine Mirovaia on 25.10.21.
//

import Foundation


//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.


enum CarWindowState {
    case open
    case close
}
enum TransmissionType {
    case automatic
    case manual
    case variator
}
class Car {
    let color: String
    let transmission: TransmissionType
    var km: Double = 0.0
    let mp3: Bool
    var windowState: CarWindowState = .close
    var engineWorking: Bool = false
    
    init(color: String, transmission: TransmissionType, mp3: Bool) {
        self.color = color
        self.transmission = transmission
        self.mp3 = mp3
    }
    
    func doAction(action: CarActions) {
        switch action {
        case .closeWindows:
            windowState = .close
        case .openWindows:
            windowState = .open
        case .startEngine:
            engineWorking = true
        case .stopEngine:
            engineWorking = false
        default: break
            
        }
    }
}


class SportCar: Car {
    let maxSpeed: Int
    var useNitro: Bool = false
    
    init(maxSpeed: Int,
         color: String,
         transmission: TransmissionType,
         mp3: Bool) {
        self.maxSpeed = maxSpeed
        super.init(
            color: color,
            transmission: transmission,
            mp3: mp3)
    }
    
    override func doAction(action: CarActions) {
        super.doAction(action: action)
        
        switch action {
        case .nitroOn:
            useNitro = true
        case .nitroOff:
            useNitro = false
        default:
            print("Wrong action for Sport car")
        }
    }
}


class TrankCar: Car {
    let maxWeight: Int
    var loaded: Bool = false
    
    init(maxWeight: Int,
         color: String,
         transmission: TransmissionType,
         mp3: Bool) {
        
        self.maxWeight = maxWeight
        super.init(color: color, transmission: .manual, mp3: mp3)
    }
    
    override func doAction(action: CarActions) {
        super.doAction(action: action)
        
        switch action {
        case .load:
            loaded = true
        case .unload:
             loaded = false
        default:
            print("Wrong action for Trank car")
        }
    }
}

enum CarActions {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    // trank actions
    case load
    case unload
    // sport car actions
    case nitroOn
    case nitroOff
    
}



let ferrari = SportCar(maxSpeed: 230, color: "Blue", transmission: .manual, mp3: true)
ferrari.doAction(action: .nitroOn)
print("Ferrari color \(ferrari.color)")


let volvo = TrankCar(maxWeight: 1500, color: "White", transmission: .manual, mp3: false)
volvo.doAction(action: .load)
print("Volvo load state \(volvo.loaded)")
