//
//  GGUnweightedEdge.swift
//  GGGraph
//
//  Created by 張子晏 on 2016/12/8.
//  Copyright © 2016年 張子晏. All rights reserved.
//

/// A basic unweighted edge.
open class GGUnweightedEdge: GGEdge, Equatable, CustomStringConvertible {
    public var originVertex: Int
    public var destinationVertex: Int
    public var weighted: Bool { return false }
    public let directed: Bool
    public var reversed: GGEdge {
        return GGUnweightedEdge(originVertex: destinationVertex, destinationVertex: originVertex, directed: directed)
    }
    
    public init(originVertex: Int, destinationVertex: Int, directed: Bool) {
        self.originVertex = originVertex
        self.destinationVertex = destinationVertex
        self.directed = directed
    }
    
    // Implement Printable protocol
    public var description: String {
        if directed {
            return "\(originVertex) -> \(destinationVertex)"
        }
        return "\(originVertex) <-> \(destinationVertex)"
    }
    
    // Mark: Operator Overloads
    static public func == (lhs: GGUnweightedEdge, rhs: GGUnweightedEdge) -> Bool {
        return lhs.originVertex == rhs.originVertex && lhs.destinationVertex == rhs.destinationVertex && lhs.directed == rhs.directed
    }
}
