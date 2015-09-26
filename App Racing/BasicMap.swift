//
//  BasicMap.swift
//  App Racing
//
//  Created by Hat Dao on 9/26/15.
//  Copyright © 2015 Bang Dao. All rights reserved.
//

import Foundation


class Solution {
    var command: String
    var destination: Array<Int>
    
    init(command: String, destination: Array<Int>){
        self.command = command
        self.destination = destination
    }
}

class Map {
    var map: Array<Array<Int>>
    var start_x: Int
    var start_y: Int
    var end_x: Int
    var end_y: Int
    var solutions: Array<Solution>
    init (map: Array<Array<Int>>, start: Array<Int>, end: Array<Int>, solutions: Array<Solution>) {
        self.map = map
        self.start_x = start[0]
        self.start_y = start[1]
        self.end_x = end[0]
        self.end_y = end[1]
        self.solutions = solutions
    }
    
    static func getMap(level: Int) -> Map {
        switch(level) {
        case 1:
            return BasicMap.map1
        case 2:
            return BasicMap.map2
        case 3:
            return BasicMap.map3
        default:
            break
        }
        return BasicMap.map4
    }
}


struct BasicMap {
    static let map1 = Map(map: [
        [0, -18],
        [0, -17],
        [0, -16],
        [0, -15],
        [0, -14],
        [0, -13],
        [0, -12],
        [0, -11],
        [0, -10],
        [0, -9],
        [0, -8],
        [0, -7],
        [0, -6],
        [0, -5],
        [0, -4],
        [0, -3],
        [0, -2],
        [0, -1],
        [0, 0],
        [0, 1],
        [0, 2],
        [0, 3],
        [0, 4],
        [0, 5],
        [0, 6],
        [0, 7],
        [0, 8],
        [0, 9],
        [0, 10],
        [0, 11],
        [0, 12],
        [0, 13],
        [0, 14],
        [0, 15],
        [0, 16],
        [0, 17],
        [0, 18],
        ], start: [0, 18], end: [0, -18],
        solutions: [
            Solution(command: "goStraight();", destination: [0, -18])
        ])
    
    static let map2 = Map(map: [
        [-10, -18],
        [-10, -17],
        [-10, -16],
        [-10, -15],
        [-10, -14],
        [-10, -13],
        [-10, -12],
        [-10, -11],
        [-10, -10],
        [-10, -9],
        [-10, -8],
        [-10, -7],
        [-10, -6],
        [-10, -5],
        [-10, -4],
        [-10, -3],
        [-10, -2],
        [-10, -1],
        [-10, 0],
        [-9, 0],
        [-8, 0],
        [-7, 0],
        [-6, 0],
        [-5, 0],
        [-4, 0],
        [-3, 0],
        [-2, 0],
        [-1, 0],
        [0, 0],
        [1, 0],
        [2, 0],
        [3, 0],
        [4, 0],
        [5, 0],
        [6, 0],
        [7, 0],
        [8, 0],
        [9, 0],
        [10, 0],
        [10, 1],
        [10, 2],
        [10, 3],
        [10, 4],
        [10, 5],
        [10, 6],
        [10, 7],
        [10, 8],
        [10, 9],
        [10, 10],
        [10, 11],
        [10, 12],
        [10, 13],
        [10, 14],
        [10, 15],
        [10, 16],
        [10, 17],
        [10, 18],
        ], start: [10, 18], end: [-10, -18],
        solutions: [
            Solution(command: "goStraight();", destination: [10, 0]),
            Solution(command: "turnLeft();", destination: [9, 0]),
            Solution(command: "goStraight();", destination: [-10, 0]),
            Solution(command: "turnRight();", destination: [-10, -1]),
            Solution(command: "goStraight();", destination: [-10, -18]),
        ])
    
    static let map3 = Map(map: [
        [-10, -18],
        [-10, -17],
        [-10, -16],
        [-10, -15],
        [-10, -14],
        [-10, -13],
        [-10, -12],
        [-10, -11],
        [-10, -10],
        [-10, -9],
        [-9, -9],
        [-8, -9],
        [-7, -9],
        [-6, -9],
        [-5, -9],
        [-4, -9],
        [-3, -9],
        [-2, -9],
        [-1, -9],
        [0, -9],
        [0, -8],
        [0, -7],
        [0, -6],
        [0, -5],
        [0, -4],
        [0, -3],
        [0, -2],
        [0, -1],
        [0, 0],
        [0, 1],
        [0, 2],
        [0, 3],
        [0, 4],
        [0, 5],
        [0, 6],
        [0, 7],
        [0, 8],
        [0, 9],
        [1, 9],
        [2, 9],
        [3, 9],
        [4, 9],
        [5, 9],
        [6, 9],
        [7, 9],
        [8, 9],
        [9, 9],
        [10, 9],
        [10, 10],
        [10, 11],
        [10, 12],
        [10, 13],
        [10, 14],
        [10, 15],
        [10, 16],
        [10, 17],
        [10, 18],
        ], start: [10, 18], end: [-10, -18],
        solutions: [
            Solution(command: "goStraight();", destination: [10, 9]),
            Solution(command: "turnLeft();", destination: [9, 9]),
            Solution(command: "goStraight();", destination: [0, 9]),
            Solution(command: "turnRight();", destination: [0, 8]),
            Solution(command: "goStraight();", destination: [0, -9]),
            Solution(command: "turnLeft();", destination: [-1, -9]),
            Solution(command: "goStraight();", destination: [-10, -9]),
            Solution(command: "turnRight();", destination: [-10, -10]),
            Solution(command: "goStraight();", destination: [-10, -18]),
        ])
    
    static let map4 = Map(map: [
        [-5, -18],
        [-5, -17],
        [-5, -16],
        [-5, -15],
        [-5, -14],
        [-5, -13],
        [-5, -12],
        [-5, -11],
        [-5, -10],
        [-5, -9],
        [-5, -9],
        [-5, -8],
        [-5, -7],
        [-5, -6],
        [-5, -5],
        [-5, -4],
        [-5, -3],
        [-5, -2],
        [-5, -1],
        [-5, 0],
        [-5, 1],
        [-5, 2],
        [-5, 3],
        [-5, 4],
        [-5, 5],
        [-5, 6],
        [-5, 7],
        [-5, 8],
        [-5, 9],
        [-5, 10],
        [-5, 11],
        [-5, 12],
        [-5, 13],
        [-5, 14],
        [-5, 15],
        [-5, 16],
        [-5, 17],
        [-5, 18],
        [-4, 18],
        [-3, 18],
        [-2, 18],
        [-1, 18],
        [0, 18],
        [1, 18],
        [2, 18],
        [3, 18],
        [4, 18],
        [5, 18],
        [5, 17],
        [5, 16],
        [5, 15],
        [5, 14],
        [5, 13],
        [5, 12],
        [5, 11],
        [5, 10],
        [5, 9],
        [5, 8],
        [5, 7],
        [5, 6],
        [5, 5],
        [5, 4],
        [5, 3],
        [5, 2],
        [5, 1],
        [5, 0],
        [5, -1],
        [5, -2],
        [5, -3],
        [5, -4],
        [5, -5],
        [5, -6],
        [5, -7],
        [5, -8],
        [5, -9],
        [5, -10],
        [5, -11],
        [5, -12],
        [5, -13],
        [5, -14],
        [5, -15],
        [5, -16],
        [5, -17],
        [5, -18],
        [4, -18],
        [3, -18],
        [2, -18],
        [1, -18],
        [0, -18],
        [-1, -18],
        [-2, -18],
        [-3, -18],
        [-4, -18],
        ], start: [-4, -18], end: [-5, -18],
        solutions: [
            Solution(command: "goStraight();", destination: [5, -18]),
            Solution(command: "turnRight();", destination: [5, -17]),
            Solution(command: "goStraight();", destination: [5, 18]),
            Solution(command: "turnRight();", destination: [4, 18]),
            Solution(command: "goStraight();", destination: [-5, 18]),
            Solution(command: "turnRight();", destination: [-5, 17]),
            Solution(command: "goStraight();", destination: [-5, -18]),
        ])
}