/// Swift 5: Elegant Ways to Generate Arrays of Random Numbers
/// https://www.youtube.com/watch?v=zVEcPJQc5dg&t=245s&ab_channel=LearntoCodewithKarolyNyisztor
func genearteRandomNambers(size: Int) -> [Int] {
    guard size > 0 else {
        return [Int]()
    }
    
    var result = Array(repeating: 0, count: size)
    for index in 0..<result.count {
        result[index] = Int.random(in: 0..<size)
    }
   
    return result.sorted()
}

/// Бинарный поиск
/// list принимает сортирвоанный список
/// value - искомое значение
/// Возвращаемое значение - индекс искомого числа или nil
/// Скорость выполнения O(log n)
func binarySearch(list: [Int], value: Int) -> Int? {
    var low = 0
    var high = list.count - 1
    
    while low <= high {
        var mid = (low + high) / 2
        var guess = list[mid]
        if guess == value {
            return mid
        }
        if guess > value {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return nil
}

binarySearch(list: genearteRandomNambers(size: 500), value: Int.random(in: 0..<500))
