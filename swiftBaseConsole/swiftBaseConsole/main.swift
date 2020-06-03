//
//  main.swift
//  swiftBaseConsole
//
//  Created by MACUSER on 01.06.2020.
//  Copyright © 2020 MACUSER. All rights reserved.
//

import Foundation

deposit()

func deposit(){
  
    print("Введите сумму вклада и процент через пробел.")
    
    var sum: Double? = 0
    var procent: Double? = 0
    
    let params: [String]
    
    if let inputValue = readLine() {
        
        params = inputValue.components(separatedBy: " ")
    
        sum = Double(params[0])
        procent = Double(params[1])
        
    }
        
    if let value = procent {

        if value < 0 {
            
            print("Значение процента должо быть положительным.")
            return
            
        }
        
        
        procent = value / 100
         
    } else {

        print("Введено неверное значение процента.")
        return
     
    }
    
    if var value = sum {
            
        if value < 0 {
            
            print("Значение суммы вклада должо быть положительным.")
            return
            
        }
        
        
        for _ in 0...5 {
                
            value = value * (1 + (procent ?? 0))
                
        }
        
        sum = value

    } else {
        
        print("Введено неверное значение суммы вклада.")
        return
        
    }
    
    print("Через 5 лет сумма вклада составит: \(sum!)")
        
}
