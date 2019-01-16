import XCTest
import KrakenKit

final class KrakenKitTests: XCTestCase {
    func testUpperBound() {        
        //                0     1    2   3  4  5    6  7  8  9 10  11 12  13
        let a: [Float] = [-1, -0.5, 0.9, 1, 2, 3,   4, 5, 6, 7, 8, 9, 10]
        let b: [Float] = [-1, -0.5, 0.9, 1, 2, 3,   4, 5, 6, 7, 8, 9, 10, 11]
        let c: [Float] = [-1, -0.5, 0.9, 1, 2, 3.3, 4, 5, 6, 7, 8, 9, 10, 11]
        let d: [Float] = [-1, -0.5, 0.9, 1, 2, 3.3, 4, 5, 6, 7, 8, 9, 10]
        
        
        
        XCTAssertEqual(a.upperBound(value: 1.0), 4)
        XCTAssertEqual(a.upperBound(value: 0.99), 3)
        XCTAssertEqual(b.upperBound(value: 1.0), 4)
        XCTAssertEqual(b.upperBound(value: 0.99), 3)
        
        XCTAssertEqual(a.upperBound(value: -10), 0)
        XCTAssertEqual(a.upperBound(value: 100), 12)
        XCTAssertEqual(b.upperBound(value: 100), 13)

        XCTAssertEqual(b.upperBound(value: -10), 0)
        
        XCTAssertEqual(c.upperBound(value: 3.3), 6)
        XCTAssertEqual(c.upperBound(value: 3.4), 6)
        XCTAssertEqual(d.upperBound(value: 3.3), 6)
        XCTAssertEqual(d.upperBound(value: 3.4), 6)

    }

    static var allTests = [
        ("testUpperBound", testUpperBound),
    ]
}
