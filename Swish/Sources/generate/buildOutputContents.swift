import Foundation

func buildOutputContents(sortedSymbolTuple: [SymbolTuple], releaseYears: Releases) -> String {
  var output: String = ""
  output += """
// This file has been generated. Recreate it by running `swish generate`

import SwiftUI

public enum SFSymbol: String {

"""

  for symbolTuple in sortedSymbolTuple
  {
    output += "  @"
      + releaseYears[symbolTuple.released]!.availabilty
      + " case " + symbolTuple.symbol.replacementName
      + " = \"" + symbolTuple.symbol
      + "\"\n"
  }
  output += """
}

extension SFSymbol: CaseIterable {
  public static var allCases: [SFSymbol] {
    var allCases: [SFSymbol] = []

"""

  for symbolTuple in sortedSymbolTuple {
    output += "    if #"
      + releaseYears[symbolTuple.released]!.availabilty
      + " { allCases.append(SFSymbol."
      + symbolTuple.symbol.replacementName
      + ") }\n"
  }
  output += """
    return allCases
  }
}

"""
  return output
}
