import Foundation

func buildOutputContents(sortedSymbolTuple: [SymbolTuple], releaseYears: Releases) -> String {
  var output: String = ""
  output += """
// This file has been generated. Recreate it by running `swish generate`

import Foundation

public enum SFSymbolName: String, Codable {

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

extension SFSymbolName: CaseIterable {
  public static var allCases: [SFSymbolName] {
    var allCases: [SFSymbolName] = []

"""

  for symbolTuple in sortedSymbolTuple {
    output += "    if #"
      + releaseYears[symbolTuple.released]!.availabilty
      + " { allCases.append(."
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
