//
//  GGEdge.swift
//  GGGraph
//
//  Created by 張子晏 on 2016/12/8.
//  Copyright © 2016年 張子晏. All rights reserved.
//

/// A protocol that all edges in a graph must conform to.
public protocol GGEdge: CustomStringConvertible {
    /// The origin vertex of the edge
    var originVertex: Int { get set } // made modifiable for changing when removing verices
    /// The destination vertex of the edge
    var destinationVertex: Int { get set } // made modifiable for changing when removing verices
    
    var weighted: Bool { get }
    var directed: Bool { get }
    var reversed: GGEdge { get }
}
