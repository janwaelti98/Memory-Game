import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0 ..< self.count{
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}

extension Array {
    /*
     wenn im Array genau ein Element, dann gib dieses Element zurück, ansonsten gib null zurück
     */
    var only: Element? {
        count == 1 ? self.first : nil
    }
}
