//
//  TimeCar_PokerUITests.swift
//  TimeCar PokerUITests
//
//  Created by Maurice McCabe on 02/05/2017.
//
//

import XCTest

class TimeCar_PokerUITests: XCTestCase {
  
    
    func testExample() {
      // 1
      let app = XCUIApplication()
      setupSnapshot(app)
      app.launch()
      
      // 2
      let chipCountTextField = app.textFields["chip count"]
      chipCountTextField.tap()
      chipCountTextField.typeText("10")
      // 3
      let bigBlindTextField = app.textFields["big blind"]
      bigBlindTextField.tap()
      bigBlindTextField.typeText("100")
      // 4
      snapshot("01UserEntries")
      // 5
      app.buttons["what should i do"].tap()
      snapshot("02Suggestion")
    }
    
}
