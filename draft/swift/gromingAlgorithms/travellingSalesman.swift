// Определяем тип для матрицы расстояний
typealias DistanceMatrix = [[Int]]

// Создаем матрицу расстояний между городами
// Значение distances[i][j] равно расстоянию от города i до города j
let distances: DistanceMatrix = [
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
]

// Находим самый короткий путь
func shortestPath(distances: DistanceMatrix) -> [Int] {
    let n = distances.count
    var path: [Int] = [0]
    var visited: [Bool] = Array(repeating: false, count: n)
    visited[0] = true
    
    for _ in 0..<n-1 {
        var minDistance = Int.max
        var closestCity = -1
        
        // Находим ближайший непосещенный город
        for city in 0..<n {
            let distance = distances[path.last!][city]
            if !visited[city] && distance < minDistance {
                minDistance = distance
                closestCity = city
            }
        }
        
        // Добавляем ближайший город в путь и отмечаем его как посещенный
        path.append(closestCity)
        visited[closestCity] = true
    }
    
    return path
}

// Выводим результат
let path = shortestPath(distances: distances)
print("Short path: \(path)")
