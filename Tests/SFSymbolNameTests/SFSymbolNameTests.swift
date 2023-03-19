import XCTest
@testable import SFSymbolName

final class SFSymbolNameTests: XCTestCase {
  func testExample() {
    XCTAssertEqual(SFSymbolName.circle.rawValue, "circle")
    XCTAssertEqual(SFSymbolName.circleGrid3x3.rawValue, "circle.grid.3x3")
  }
}
