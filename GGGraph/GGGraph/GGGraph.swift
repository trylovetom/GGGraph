//
//  GGGraph.swift
//  GGGraph
//
//  Created by 張子晏 on 2016/12/8.
//  Copyright © 2016年 張子晏. All rights reserved.
//

/// The superclass for all graphs. Defined as a class instead of a protocol so that its subclasses can have some method implementations in common. You should generally use one of its two canonical subclasses, *UnweightedGraph* and *WeightedGraph*, because they offer more functionality and convenience.

open class GGGraph<VertexType: Equatable>: CustomStringConvertible, Sequence, Collection {
    var vertices: [VertexType] = [VertexType]()
    var edges: [[GGEdge]] = [[GGEdge]]() // adjacency lists
    
    // How many vertices are in the graph?
    public var vertexCount: Int {
        return vertices.count
    }
    
    // How many edges in the graph?
    public var edgeCount: Int {
        return edges.joined().count
    }
    
    /// An immutable array containing all of the vertices in the graph.
    public var immutableVertices: [VertexType] {
        return vertices
    }
    
    public init() {}
    
    public init(vertices: [VertexType]) {
        for vertex in vertices {
            _ = addVertex(vertex)
        }
    }
    
    /// Get a vertex by its index.
    ///
    /// - parameter index: THe index of the vertex.
    /// - return: The vertex at i.
    public func vertexAtIndex(_ index: Int) -> VertexType {
        return vertices[index]
    }
    
    /// Find the first occrtence of a vertex if it exists.
    ///
    /// - parameter vertex: The vertex you are looking for.
    /// - returns: The index of the vertex. Return nil if it can't find it.
    public func indexOfVertex(_ vertex: VertexType) -> Int? {
        if let i = vertices.index(of: vertex) {
            return i
        }
        return nil
    }
    
    /// Find all of the neighbors of a vertex at a given index.
    ///
    /// - parameter index: The index for the vertex to find the neighbors of.
    /// - returns: An array of the neighbor vertices.
    public func neighborsForIndex(_ index: Int) -> [VertexType] {
        return edges[index].map({
            self.vertices[$0.destinationVertex]
        })
    }
    
    /// Find all of the neighbors of a given Vertex.
    ///
    /// - parameter vertex: The vertex to find the neighbors of.
    /// - returns: An array of the neighbor vertices.
    public func neighborsForVertex(_ vertex: VertexType) -> [VertexType] {
        if let i = indexOfVertex(vertex) {
            return neighborsForIndex(i)
        }
        return [VertexType]()
    }
    
    /// Find all of the edges of a vertex at a given index.
    ///
    /// - parameter index: The index for the vertex to find the children of.
    public func edgesForIndex(_ index: Int) -> [GGEdge] {
        return edges[index]
    }
    
    /// Find all of edges of a given vertex.
    ///
    /// - parameter vertex: The vertex to find the edges of.
    public func edgesForVertex(_ vertex: VertexType) -> [GGEdge]? {
        if let i = indexOfVertex(vertex) {
            return edgesForIndex(i)
        }
        return nil
    }
    
    /// Is there an edge from one vertex to another?
    ///
    /// - parameter from: The index of the starting edge.
    /// - parameter to: The index of the ending edge.
    /// - returns: A Bool that is true if such an edge exists, and false otherwise.
    public func edgeExists(from: Int, to: Int) -> Bool {
        return edges[from].map({
            $0.destinationVertex
        }).contains(to)
    }
    
    /// Is there an edge from one vertext to another? Note this will look at the first occurence of each vertex. Also returns false if either of the supplied vertices cannot be found in the graph.
    ///
    /// - parameter from: The first vertex.
    /// - parameter to: The second vertex.
    /// - returns: A Bool that is true if such an edge exists, and false otherwish.
    public func edgeExists(from: VertexType, to: VertexType) -> Bool {
        if let origionIndex = indexOfVertex(from) {
            if let destinationIndex = indexOfVertex(to) {
                return edgeExists(from: origionIndex, to: destinationIndex)
            }
        }
        return false
    }
    
    /// Find the first occurence of a vertex.
    ///
    /// - parameter vertex: The vertex you are looking for.
    public func vertexInGraph(vertex: VertexType) -> Bool {
        if let _ = indexOfVertex(vertex) {
            return true
        }
        return false
    }
    
    /// Add a vertex to the graph.
    ///
    /// - parameter v: The vertex to be added.
    /// - returns: The index where the vertex was added.
    public func addVertex(_ v: VertexType) -> Int {
        vertices.append(v)
        edges.append([GGEdge]())
        return vertices.count - 1
    }
    
    /// Add an edge to the graph. It should take
    ///
    /// - parameter edge: The edge to add.
    public func addEdge(_ edge: GGEdge) {
        edges[edge.originVertex].append(edge)
        if !edge.directed {
            edges[edge.destinationVertex].append(edge.reversed)
        }
    }
    
    /// Removes all edges in both directions between vertices at indexes from & to.
    ///
    /// - parameter form: The starting vertex's index.
    /// - parameter to: The ending vertex's index.
    /// - parameter bidirectional: Remove edges coming back (to -> from)
    public func removeAllEdges(from: Int, to: Int, bidirectional: Bool = true) {
        for i in 0 ..< edges[from].count where edges[from][i].destinationVertex == to {
            edges[from].remove(at: i)
        }
        
        if bidirectional {
            for i in 0 ..< edges[to].count where edges[to][i].destinationVertex == from {
                edges[to].remove(at: i)
            }
        }
    }
    
    /// Removes all edges in both directions between two vertives.
    ///
    /// - parameter from: The starting vertex.
    /// - parameter fo: The ending vertex.
    /// - parameter bidriectional: Remove edges coming back (to -> from)
    public func removeAllEdges(from: VertexType, to: VertexType, bidirectional: Bool = true) {
        if let origionIndex = indexOfVertex(from) {
            if let destinationIndex = indexOfVertex(to) {
                removeAllEdges(from: origionIndex, to: destinationIndex, bidirectional: bidirectional)
            }
        }
    }
    
    /// Removes a vertex at a specified index, all of the edges attached to it, and renumbers the indexes of the rest of the edges.
    ///
    /// - parameter index: The index of the vertex.
    public func removeVertexAtIndex(_ index: Int) {
        // remove all aedges ending at the vertex, first doing the ones below it
        // renumber edges tha end after the index
        for j in 0 ..< index {
            var toRemove: [Int] = [Int]()
            
            for l in 0 ..< edges[j].count {
                if edges[j][l].destinationVertex == index {
                    toRemove.append(l)
                    continue
                }
                if edges[j][l].destinationVertex > index {
                    edges[j][l].destinationVertex -= 1
                }
            }
            for f in toRemove {
                edges[j].remove(at: f)
            }
        }
        
        // remove all edges after the vertex index wise
        // renumber all edges after the vertex index wise
        for j in (index + 1) ..< edges.count {
            var toRemove: [Int] = [Int]()
            
            for l in 0 ..< edges[j].count {
                if edges[j][l].destinationVertex == index {
                    toRemove.append(l)
                    continue
                }
                edges[j][l].destinationVertex -= 1
                if edges[j][l].destinationVertex > index {
                    edges[j][l].destinationVertex -= 1
                }
            }
            for f in toRemove {
                edges[j].remove(at: f)
            }
        }
        
        // remove the actual vertex its edges
        edges.remove(at: index)
        vertices.remove(at: index)
    }
    
    /// Removes the first occurence of a vertex, all of the edges attached to it, and renumbers the indexes of the rest of the edges.
    ///
    /// - parameter vertex: The vertex to ve removes..
    public func removeVertex(_ vertex: VertexType) {
        if let i = indexOfVertex(vertex) {
            removeVertexAtIndex(i)
        }
    }
    
    // Implement Printable protocol
    public var description: String {
        var description: String = ""
        
        for i in 0 ..< vertices.count {
            description += "\(vertices[i]) -> \(neighborsForIndex(i))\n"
        }
        return description
    }
    
    // Implement SequenceType
    public typealias Iterator = AnyIterator<VertexType>
    
    public func makeIterator() -> Iterator {
        var index = 0
        
        return AnyIterator {
            if index < self.vertices.count {
                index += 1
                return self.vertexAtIndex(index - 1)
            }
            return nil
        }
    }
    
    // Implement CollectionType
    public typealias Index = Int
    
    public var startIndex: Int {
        return 0
    }
    
    public var endIndex: Int {
        return vertexCount
    }
    
    public func index(after i: GGGraph.Index) -> GGGraph.Index {
        return i + 1
    }
    
    public subscript(i: Int) -> VertexType {
        return vertexAtIndex(i)
    }
}
