//
//  GGUnweightedGraph.swift
//  GGGraph
//
//  Created by 張子晏 on 2016/12/8.
//  Copyright © 2016年 張子晏. All rights reserved.
//

/// A subclass of Graph with some convenience methods for adding and removing UnweightedEdges. WeightedEdges may be added to an UnweightedGraph but their weights will be ignored.
open class GGUnweightedGraph<VertexType: Equatable>: GGGraph<VertexType> {
    public override init() {
        super.init()
    }
    
    public override init(vertices: [VertexType]) {
        super.init(vertices: vertices)
    }
    
    /// This is a convenience method that adds an unweighted edge.
    ///
    /// - parameter from: The starting vertex's index.
    /// - parameter to: The ending vertex's index.
    /// - parameter directed: Is the edge directed? (default `false`)
    public func addEdge(from: Int, to: Int, directed: Bool = false) {
        addEdge(GGUnweightedEdge(originVertex: from, destinationVertex: to, directed: directed))
    }
    
    /// This is a convenience method that adds an unweighted, undirected edge between the first occurence of two vertices. It takes O(n) time.
    ///
    /// - parameter from: The starting vertex.
    /// - parameter to: The ending vertex.
    /// - parameter directed: Is the edge directed? (default `false`)
    public func addEdge(from: VertexType, to: VertexType, directed: Bool = false) {
        if let originIndex = indexOfVertex(from) {
            if let destinationIndex = indexOfVertex(to) {
                addEdge(GGUnweightedEdge(originVertex: originIndex, destinationVertex: destinationIndex, directed: directed))
            }
        }
    }
    
    // Have to have two of these because Edge protocol cannot adopt Equatable
    
    /// Removes a specific unweighted edge in both directions (if it's not directional). Or just one way if it's directed.
    ///
    /// - parameter edge: The edge to be removed.
    public func removeEdge(_ edge: GGUnweightedEdge) {
        if let i = (edges[edge.destinationVertex] as! [GGUnweightedEdge]).index(of: edge) {
            edges[edge.originVertex].remove(at: i)
            if !edge.directed {
                if let i = (edges[edge.destinationVertex] as! [GGUnweightedEdge]).index(of: edge.reversed as! GGUnweightedEdge) {
                    edges[edge.destinationVertex].remove(at: i)
                }
            }
        }
    }
}
