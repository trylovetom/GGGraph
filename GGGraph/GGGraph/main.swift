//
//  main.swift
//  GGGraph
//
//  Created by 張子晏 on 2016/12/8.
//  Copyright © 2016年 張子晏. All rights reserved.
//

import Foundation
import QuartzCore

let graph = GGUnweightedGraph<String>()

_ = graph.addVertex("V1")
_ = graph.addVertex("V2")
_ = graph.addVertex("V3")
_ = graph.addVertex("V4")
_ = graph.addVertex("V5")
_ = graph.addVertex("V6")
_ = graph.addVertex("V7")
_ = graph.addVertex("V8")
_ = graph.addVertex("V9")
_ = graph.addVertex("V10")
_ = graph.addVertex("V11")
_ = graph.addVertex("V12")


graph.addEdge(from: "V1", to: "V2")
graph.addEdge(from: "V1", to: "V3")
graph.addEdge(from: "V1", to: "V4")
graph.addEdge(from: "V1", to: "V5")

graph.addEdge(from: "V2", to: "V3")
graph.addEdge(from: "V2", to: "V4")
graph.addEdge(from: "V2", to: "V5")

graph.addEdge(from: "V3", to: "V4")
graph.addEdge(from: "V3", to: "V5")
graph.addEdge(from: "V3", to: "V6")
graph.addEdge(from: "V3", to: "V7")

graph.addEdge(from: "V4", to: "V5")
graph.addEdge(from: "V4", to: "V6")
graph.addEdge(from: "V4", to: "V7")

graph.addEdge(from: "V5", to: "V6")
graph.addEdge(from: "V5", to: "V7")
graph.addEdge(from: "V5", to: "V8")
graph.addEdge(from: "V5", to: "V9")
graph.addEdge(from: "V5", to: "V10")

graph.addEdge(from: "V6", to: "V7")
graph.addEdge(from: "V6", to: "V9")
graph.addEdge(from: "V6", to: "V11")
graph.addEdge(from: "V6", to: "V12")

graph.addEdge(from: "V7", to: "V8")
graph.addEdge(from: "V7", to: "V9")
graph.addEdge(from: "V7", to: "V10")
graph.addEdge(from: "V7", to: "V11")
graph.addEdge(from: "V7", to: "V12")

graph.addEdge(from: "V8", to: "V9")
graph.addEdge(from: "V8", to: "V10")

graph.addEdge(from: "V9", to: "V10")
graph.addEdge(from: "V9", to: "V11")
graph.addEdge(from: "V9", to: "V12")

graph.addEdge(from: "V11", to: "V12")

print(graph.vertices)
print(graph.description)

// Definition 2
// UC∈D C
func cov(d: Set<Set<String>>) -> Set<String> {
    var result = Set<String>()
    
    for member in d {
        result = result.union(member)
    }
    
    return result
}

// Definition 5
// rcov(v, D) = {C|v ∈ C, C ∈ D}
func rcov(v: String, d: Set<Set<String>>) -> Set<Set<String>> {
    var result = Set<Set<String>>()
    
    for member in d {
        if member.contains(v) {
            result = result.union(Set<Set<String>>([member]))
        }
    }
    return result
}

// Definition 3
// priv(C, D) = C \ cov(D \ {C})
func priv(c: Set<String>, d: Set<Set<String>>) -> Set<String> {
    return c.subtracting(cov(d: d.subtracting(Set<Set<String>>([c]))))
}

// Definition 6
// rpriv(i,D) = {C|C ∈ D,|priv(C,D)| = i}
func rpriv(i: Int, d: Set<Set<String>>) -> Set<Set<String>> {
    var result = Set<Set<String>>()
    
    for member in d {
        if priv(c: member, d: d).count == i {
            result = result.union(Set<Set<String>>([member]))
        }
    }
    return result
}

// Definition 4
// Cmin(D) = argminC∈D{|priv(C, D)|}
func cMin(d: Set<Set<String>>) -> Set<String> {
    var minMember: (Set<String>, Int) = (d.first!, priv(c: d.first!, d: d).count)
    
    for member in d {
        let candidateMember: (Set<String>, Int) = (member, priv(c: member, d: d).count)
        
        if candidateMember.1 < minMember.1 {
            minMember = candidateMember
        }
    }
    return minMember.0
}

func enumKBasic2(g: GGUnweightedGraph<String>, k: Int) -> Set<Set<String>> {
    var G = g
    var D = Set<Set<String>>()
    var numberOfCov: Int = 0
    var Cmin = Set<String>()
    var rcovV = [String: Set<Set<String>>]()
    var numberOfPrivC = [(Set<String>, Int)]()
    var rprivI = [Int : Set<Set<String>>]()
    
    func cliqueAll(p: Set<String>, r: Set<String>, x: Set<String>, graph: GGUnweightedGraph<String>) {
        var P = p
        let R = r
        var X = x
        
        var v = P.union(x)
        
        if v.isEmpty { // P ∪ X = ∅
            candMaintaionBasic(c: R)
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
    
    func delete(c: Set<String>) {
        D = D.subtracting(Set<Set<String>>([c]))
        for i in 0 ..< numberOfPrivC.count {
            if numberOfPrivC[i].0 == c {
                rprivI[numberOfPrivC[i].1] = rprivI[numberOfPrivC[i].1]?.subtracting(Set<Set<String>>([c]))
            }
        }
        for v in c {
            rcovV[v] = rcovV[v]?.subtracting(Set<Set<String>>([c]))
            if rcovV[v]?.count == 0 {
                numberOfCov -= 1
            }
            if rcovV[v]?.count == 1 {
                var maxMember: Set<String> = rcovV[v]!.first!
                
                for member in rcovV[v]! {
                    if member.count > maxMember.count {
                        maxMember = member
                    }
                }
                
                let C2: Set<String> = maxMember
                
                for i in 0 ..< numberOfPrivC.count {
                    if numberOfPrivC[i].0 == C2 {
                        numberOfPrivC[i].1 = numberOfPrivC[i].1 + 1
                        numberOfCov += 1
                        rprivI[numberOfPrivC[i].1 - 1] = rprivI[numberOfPrivC[i].1 - 1]?.subtracting(Set<Set<String>>([C2]))
                        rprivI[numberOfPrivC[i].1] = rprivI[numberOfPrivC[i].1]?.union(Set<Set<String>>([C2]))
                        break
                    }
                }
            }
        }
    }
    
    func insert(c: Set<String>) {
        numberOfPrivC.append((c, 0))
        
        D = D.union(Set<Set<String>>([c]))
        for v in c {
            if rcovV[v] != nil {
                rcovV[v] = rcovV[v]!.union(Set<Set<String>>([c]))
            } else {
                rcovV[v] = Set<Set<String>>([c])
            }
            if rcovV[v]?.count == 1 {
                for i in 0 ..< numberOfPrivC.count {
                    if numberOfPrivC[i].0 == c {
                        numberOfPrivC[i].1 = numberOfPrivC[i].1 + 1
                        numberOfCov += 1
                        break
                    }
                }
            }
            if rcovV[v]?.count == 2 {
                let C2: Set<String> = rcovV[v]!.subtracting(Set<Set<String>>([c])).first!
                
                for i in 0 ..< numberOfPrivC.count {
                    if C2 == numberOfPrivC[i].0 {
                        numberOfPrivC[i].1 = numberOfPrivC[i].1 - 1
                        rprivI[numberOfPrivC[i].1 + 1] = rprivI[numberOfPrivC[i].1 + 1]?.subtracting(Set<Set<String>>([C2]))
                        rprivI[numberOfPrivC[i].1] = rprivI[numberOfPrivC[i].1]?.union(Set<Set<String>>([C2]))
                        break
                    }
                }
            }
            for i in 0 ..< numberOfPrivC.count {
                if numberOfPrivC[i].0 == c {
                    if rprivI[numberOfPrivC[i].1] == nil {
                        rprivI[numberOfPrivC[i].1] = Set<Set<String>>()
                    }
                    rprivI[numberOfPrivC[i].1] = rprivI[numberOfPrivC[i].1]?.union(Set<Set<String>>([c]))
                    break
                }
            }
        }
        for j in 0 ..< numberOfPrivC.count {
            if numberOfPrivC[j].0 == c {
                for i in 0 ..< numberOfPrivC[j].1 {
                    if rprivI[i] == nil {
                        rprivI[i] = Set<Set<String>>()
                    }
                    if rprivI[i] != nil {
                        if !rprivI[i]!.isEmpty {
                            for member in rprivI[i]! {
                                Cmin = member
                            }
                            break
                        }
                    }
                }
            }
        }
    }
    
    func candMaintaionBasic(c: Set<String>) {
        if k < 1 {
            return
        }
        if D.count < k {
            D = D.union(Set<Set<String>>([c])) // D←D∪{C}
            insert(c: c)
            return
        }
        
        // pnew which is |priv(C,D′)| for D′ = (D\{Cmin})∪{C}
        let D2: Set<Set<String>> = D.subtracting(Set<Set<String>>([Cmin])).union(Set<Set<String>>([c]))
        let pNew: Int = priv(c: c, d: D2).count
        let alpha: Float = 0.5
        
        // pnew > |priv(Cmin)| + α × |D|
        for i in 0 ..< numberOfPrivC.count {
            if numberOfPrivC[i].0 == Cmin {
                
                if Float(pNew) > Float(numberOfPrivC[i].1) + alpha * (Float(numberOfCov) / Float(D.count)) {
                    delete(c: Cmin)
                    insert(c: c)
                }
                break
            }
        }
    }
    
    cliqueAll(p: Set<String>(G.vertices), r: Set<String>(), x: Set<String>(), graph: G)
    return D
}
let start3 = CACurrentMediaTime()
print(enumKBasic2(g: graph, k: 3))
let end3 = CACurrentMediaTime()
print("time:\(end3 - start3)")


func enumKBasic(g: GGUnweightedGraph<String>, k: Int) -> Set<Set<String>> {
    var G = g
    var D = Set<Set<String>>()
    
    func cliqueAll(p: Set<String>, r: Set<String>, x: Set<String>, graph: GGUnweightedGraph<String>) {
        var P = p
        let R = r
        var X = x
        
        var v = P.union(x)
        
        if v.isEmpty { // P ∪ X = ∅
            candMaintaionBasic(c: R)
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
    
    func candMaintaionBasic(c: Set<String>) {
        if k < 1 {
            return
        }
        if D.count < k {
            D = D.union(Set<Set<String>>([c])) // D←D∪{C}
            return
        }
        
        let cMinD = cMin(d: D)
        
        let D2 = D.subtracting(Set<Set<String>>([cMinD])).union(Set<Set<String>>([c])) // D′ ←(D\{Cmin(D)})∪{C}
        let alpha: Float = 0.5
        
        // |priv(C,D′)|>|priv(Cmin(D),D)|+α×|cov(D)|/|D|
        if Float(priv(c: c, d: D2).count) > Float(priv(c: cMinD, d: D).count) + alpha * (Float(cov(d: D).count) / Float(D.count)) {
            D = D2
        }
    }
    
    cliqueAll(p: Set<String>(G.vertices), r: Set<String>(), x: Set<String>(), graph: G)
    return D
}
let start = CACurrentMediaTime()
print(enumKBasic(g: graph, k: 3))
let end = CACurrentMediaTime()
print("time:\(end - start)")


func enumAll(g: GGUnweightedGraph<String>, k: Int) -> Set<Set<String>> {
    var G = g
    var A = Set<Set<String>>()
    
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
            
            if C2.isEmpty {
                break
            }
            
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

let start2 = CACurrentMediaTime()
print(enumAll(g: graph, k: 3))
let end2 = CACurrentMediaTime()
print("time:\(end2 - start2)")

