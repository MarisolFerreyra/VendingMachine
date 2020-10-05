//
//  main.swift
//  Assignment1_R_Ferreyra
//
//  Created by Rebecca Ferreyra on 10/3/20.
//

import Foundation

struct Drink {
    // Properties
    var drinkName: String
    var drinkCost: Double
    var initialQty: Int
    var currentQty: Int
    var qtySold: Int {
        return initialQty - currentQty
    }
    var description: String {
        return drinkName + ", " +
                String(drinkCost) +
                ", " + String(qtySold) +
                ", " + String(self.calcSales())
    }
    // Methods
    func calcSales () -> Double {
        return Double(qtySold) * drinkCost
    }
}

// Define Drinks
var drinkOne = Drink(drinkName:"Cola",drinkCost: 1.50, initialQty: 33, currentQty: 15)
var drinkTwo = Drink(drinkName:"Sprite", drinkCost: 1.15, initialQty: 40, currentQty: 5)
var drinkThree = Drink(drinkName:"Root Beer",drinkCost: 1.00, initialQty: 30, currentQty: 21)
var drinkFour = Drink(drinkName:"Squirt",drinkCost: 2.00, initialQty: 20, currentQty: 22)


// Define Vending Machine
var myVendingMachine = [drinkOne, drinkThree, drinkTwo]
var competitorsVendingMachine = [drinkTwo, drinkFour]

// Functions
func getMaxIndex(vMachine:[Drink]) -> Int {
    var answer = 0
    var index = 0
    var greatest = 0.0
    
    while index < vMachine.count {
        if greatest < vMachine[index].calcSales() {
            greatest = vMachine[index].calcSales()
            answer = index
        }
        index += 1
    }
    return answer
}

func getMinIndex(vMachine:[Drink]) -> Int {
    var answer = 0
    var index = 0
    var least =  
    
    while index < vMachine.count {
        if least   vMachine[index].calcSales() {
            least = vMachine[index].calcSales()
            answer = index
        }
        index += 1
    }
    return answer
}
for element in myVendingMachine {
    print(element.calcSales())
}

// New code!
//rebecca was here

print(getMinIndex(vMachine: myVendingMachine))
//getMaxIndex(vMachine: competitorsVendingMachine)
