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

print(graph.vertices)
print(graph.description)

func enumAll(g: GGUnweightedGraph<String>, k: Int) -> Set<Set<String>> {
    var G = g
    var A = Set<Set<String>>([Set<String>([])])
    
    func cliqueAll(p: Set<String>, r: Set<String>, x: Set<String>, graph: GGUnweightedGraph<String>) {
        var P = p
        let R = r
        var X = x
        
        var v = P.union(x)
        
        if v.isEmpty { // P ∪ X = ∅
            A.insert(R)
            return // output R as a maximal clique
        }
        
        // u ← argmaxv∈P∪X{|P ∩ N(v)|}
        var maxMember: (String, Int) = (v.first!, Set<String>(graph.neighborsForVertex(v.first!)).intersection(P).count)
        
        for member in v {
            let candidateMember: (String, Int) = (member, Set<String>(graph.neighborsForVertex(member)).intersection(P).count)
            
            if candidateMember.1 > maxMember.1 {
                maxMember = candidateMember
            }
        }
        
        let u = maxMember.0
        
        v = P.subtracting(Set<String>(graph.neighborsForVertex(u))) // v∈P\N(u)
        
        // for all v∈P\N(u)do
        for member in v {
            let memberSet = Set<String>([member])
            
            cliqueAll(p: P.intersection(Set<String>(graph.neighborsForVertex(member))), r: R.union(memberSet), x: X.intersection(graph.neighborsForVertex(member)), graph: graph)
            P = P.subtracting(memberSet)
            X = X.union(memberSet)
        }
    }
    
    func maxCover(v: Set<String>, s: Set<Set<String>>, k: Int) -> Set<Set<String>> {
        var D = Set<Set<String>>()
        let S = s
        var V2 = v
        
        for _ in 0 ..< k {
            // C ← argmaxC′∈S−D{|C′ ∩ V′|}
            let C2 = S.subtracting(D)
            
            var maxMember: (Set<String>, Int) = (C2.first!, C2.first!.intersection(V2).count)
            
            for member in C2 {
                let candidateMember: (Set<String>, Int) = (member, member.intersection(V2).count)
                
                if candidateMember.1 > maxMember.1 {
                    maxMember = candidateMember
                }
            }
            
            let C = maxMember.0
            
            V2 = V2.subtracting(C)
            D = D.union(Set<Set<String>>([C]))
        }
        return D
    }
    
    
    cliqueAll(p: Set<String>(G.vertices), r: Set<String>(), x: Set<String>(), graph: G)
    return maxCover(v: Set<String>(G.vertices), s: A, k: k)
}

print(enumAll(g: graph, k: 1))



