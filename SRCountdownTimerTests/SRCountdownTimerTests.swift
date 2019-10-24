/*
 MIT License

 Copyright (c) 2017 Ruslan Serebriakov <rsrbk1@gmail.com>

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import XCTest
@testable import SRCountdownTimer

class SRCountdownTimerTests: XCTestCase {
    var timer: SRCountdownTimer?

    var expectationTimerDidStop: XCTestExpectation?
    var timerDidStopFlag = false

    var expectationTimerDidUpdate: XCTestExpectation?
    var updatedCounterValue: [Int] = []

    override func setUp() {
        super.setUp()
        
        timer = SRCountdownTimer(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        timer?.delegate = self
    }

    override func tearDown() {
        timer = nil
        super.tearDown()
    }

    func testTimerIsSquare() {
        let width = 10
        let height = width
        let timer = SRCountdownTimer(frame: CGRect(x: 0, y: 0, width: width, height: height))
        XCTAssertNotNil(timer)
    }
    
    func testTimerDidStope() {
        let totalTimeExpectation = 2

        // given
        expectationTimerDidStop = self.expectation(description: "Expected timerDidEnd")

        // when
        timer?.start(beginingValue: totalTimeExpectation, interval: 0.1)

        // then
        waitForExpectations(timeout: TimeInterval(totalTimeExpectation), handler: nil)

        XCTAssertTrue(timerDidStopFlag)
    }
    
    func testTimerDidUpdateCounterValue() {
        let totalTimeExpectation = 5
        let updatedCounterArr: [Int] = [5,4,3,2,1]

        // given
        expectationTimerDidUpdate = self.expectation(description: "Expected timerDidUpdateCounterValue")

        // when
        timer?.start(beginingValue: totalTimeExpectation, interval: 0.1)

        // then
        waitForExpectations(timeout: TimeInterval(totalTimeExpectation), handler: nil)
        
        XCTAssertTrue(updatedCounterArr == updatedCounterValue)
    }
 
}

extension SRCountdownTimerTests: SRCountdownTimerDelegate {
    func timerDidEnd(sender: SRCountdownTimer) {
        if sender === timer {
            expectationTimerDidStop?.fulfill()
            timerDidStopFlag = true
        }
    }
    
    func timerDidUpdateCounterValue(sender: SRCountdownTimer, newValue: Int) {
        if sender === timer {
            print (newValue)
            updatedCounterValue.append(newValue)
            
            if newValue == 1 && expectationTimerDidUpdate != nil {
                expectationTimerDidUpdate?.fulfill()
            }
        }
    }
}


