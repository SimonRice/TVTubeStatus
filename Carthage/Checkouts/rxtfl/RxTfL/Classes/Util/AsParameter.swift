import Foundation

extension CustomStringConvertible {
    var asParameter: String {
        return "\(self)"
    }
}

extension Array where Element: CustomStringConvertible {
    var asParameter: String {
        return self.map({ "\($0)" }).joined(separator: ",")
    }
}
