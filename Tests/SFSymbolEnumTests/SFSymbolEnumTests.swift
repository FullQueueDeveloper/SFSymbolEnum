import XCTest
@testable import SFSymbolEnum

final class SFSymbolEnumTests: XCTestCase {
  func testExample() {
    XCTAssertEqual(SFSymbol.circle.rawValue, "circle")
    XCTAssertEqual(SFSymbol.circleGrid3x3.rawValue, "circle.grid.3x3")
  }
}
