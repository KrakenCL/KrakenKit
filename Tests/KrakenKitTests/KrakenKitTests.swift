import XCTest
import KrakenKit

final class KrakenKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        KrakenKit().test()
        XCTAssertEqual(2.0, 2.0)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
