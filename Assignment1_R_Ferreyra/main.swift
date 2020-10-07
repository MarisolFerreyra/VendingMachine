//
//  main.swift
//  Assignment1_R_Ferreyra
//
//  Created by Rebecca Ferreyra on 10/3/20.
//

import Foundation
// Struc Name
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
var drinkOne = Drink(drinkName:"Cream Soda",drinkCost: 1.25, initialQty: 20, currentQty: 10)
var drinkTwo = Drink(drinkName:"Lemonade", drinkCost: 1.25, initialQty: 15, currentQty: 10)
var drinkThree = Drink(drinkName:"Root Beer",drinkCost: 1.75, initialQty: 15, currentQty: 5)

// Define Vending Machine
var myVendingMachine = [drinkOne, drinkTwo, drinkThree]

// Functions
func getMaxIndex(_ vMachine:[Drink]) -> Int {
    var answer = 0
    var index = 0
    var greatest = vMachine[0].calcSales()
    
    while index < vMachine.count {
        if greatest < vMachine[index].calcSales() {
            greatest = vMachine[index].calcSales()
            answer = index
        }
        index += 1
    }
    return answer
}

func getMinIndex(_ vMachine:[Drink]) -> Int {
    var answer = 0
    var index = 0
    var least = vMachine[0].calcSales()
    
    while index < vMachine.count {
        if least > vMachine[index].calcSales() {
            least = vMachine[index].calcSales()
            answer = index
        }
        index += 1
    }
    return answer
}

func calcTotalSales(_ vMachine:[Drink]) -> Double {
    var index = 0
    var sum = 0.0
    
    while index < vMachine.count {
        sum += vMachine[index].calcSales()
        index += 1
    }
    return sum
}

func displayResult(_ vMachine:[Drink]) {
    var index = 0
    // Establish Column Widths
    let columnPadLength = 12
    // Define Header String
    let headerString = "Drink Name".padding(toLength: columnPadLength, withPad: " ", startingAt: 0) +
                       "Cost".padding(toLength: 8, withPad: " ", startingAt: 0) +
                       "Qty Sold".padding(toLength: columnPadLength, withPad: " ", startingAt: 0) +
                       "Sales".padding(toLength: columnPadLength, withPad: " ", startingAt: 0)
    print(headerString)
    while index < vMachine.count {
        print(vMachine[index].drinkName +
                "\t" + String(vMachine[index].drinkCost) +
                "\t" + String(vMachine[index].qtySold) +
                "\t\t\t" + String(vMachine[index].calcSales()))
        index += 1
    }
    print("\n")
    let x = getMaxIndex(vMachine)
    print(vMachine[x].drinkName + " has the most sales: " + String(vMachine[x].calcSales()))
    let y = getMinIndex(vMachine)
    print(vMachine[y].drinkName + " has the least sales: " + String(vMachine[y].calcSales()))
    print("Total Sales: \(calcTotalSales(vMachine))")
    print("\n")
}

displayResult(myVendingMachine)
