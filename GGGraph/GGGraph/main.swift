//
//  main.swift
//  GGGraph
//
//  Created by 張子晏 on 2016/12/8.
//  Copyright © 2016年 張子晏. All rights reserved.
//

import Foundation

let graph = GGUnweightedGraph<String>()

_ = graph.addVertex("A")
_ = graph.addVertex("B")
_ = graph.addVertex("C")
_ = graph.addVertex("D")

graph.addEdge(from: "A", to: "C")
graph.addEdge(from: "C", to: "B")
graph.addEdge(from: "B", to: "D")
graph.addEdge(from: "D", to: "C")

print(graph.description)
for vertex in graph.vertices {
    print(vertex)
}












