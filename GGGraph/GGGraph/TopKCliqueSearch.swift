//
//  TopKCliqueSearch.swift
//  GGGraph
//
//  Created by 張子晏 on 2016/12/17.
//  Copyright © 2016年 張子晏. All rights reserved.
//

import Foundation
import QuartzCore

func TopKCliqueSearch() {
    let graph = GGUnweightedGraph<String>()
    
    _ = graph.addVertex("Myriel")
    _ = graph.addVertex("Napoleon")
    _ = graph.addVertex("Mlle.Baptistine")
    _ = graph.addVertex("Mme.Magloire")
    _ = graph.addVertex("CountessdeLo")
    _ = graph.addVertex("Geborand")
    _ = graph.addVertex("Champtercier")
    _ = graph.addVertex("Cravatte")
    _ = graph.addVertex("Count")
    _ = graph.addVertex("OldMan")
    _ = graph.addVertex("Labarre")
    _ = graph.addVertex("Valjean")
    _ = graph.addVertex("Marguerite")
    _ = graph.addVertex("Mme.deR")
    _ = graph.addVertex("Isabeau")
    _ = graph.addVertex("Gervais")
    _ = graph.addVertex("Tholomyes")
    _ = graph.addVertex("Listolier")
    _ = graph.addVertex("Fameuil")
    _ = graph.addVertex("Blacheville")
    _ = graph.addVertex("Favourite")
    _ = graph.addVertex("Dahlia")
    _ = graph.addVertex("Zephine")
    _ = graph.addVertex("Fantine")
    _ = graph.addVertex("Mme.Thenardier")
    _ = graph.addVertex("Thenardier")
    _ = graph.addVertex("Cosette")
    _ = graph.addVertex("Javert")
    _ = graph.addVertex("Fauchelevent")
    _ = graph.addVertex("Bamatabois")
    _ = graph.addVertex("Perpetue")
    _ = graph.addVertex("Simplice")
    _ = graph.addVertex("Scaufflaire")
    _ = graph.addVertex("Woman1")
    _ = graph.addVertex("Judge")
    _ = graph.addVertex("Champmathieu")
    _ = graph.addVertex("Brevet")
    _ = graph.addVertex("Chenildieu")
    _ = graph.addVertex("Cochepaille")
    _ = graph.addVertex("Pontmercy")
    _ = graph.addVertex("Boulatruelle")
    _ = graph.addVertex("Eponine")
    _ = graph.addVertex("Anzelma")
    _ = graph.addVertex("Woman2")
    _ = graph.addVertex("MotherInnocent")
    _ = graph.addVertex("Gribier")
    _ = graph.addVertex("Jondrette")
    _ = graph.addVertex("Mme.Burgon")
    _ = graph.addVertex("Gavroche")
    _ = graph.addVertex("Gillenormand")
    _ = graph.addVertex("Magnon")
    _ = graph.addVertex("Mlle.Gillenormand")
    _ = graph.addVertex("Mme.Pontmercy")
    _ = graph.addVertex("Mlle.Vaubois")
    _ = graph.addVertex("Lt.Gillenormand")
    _ = graph.addVertex("Marius")
    _ = graph.addVertex("BaronessT")
    _ = graph.addVertex("Mabeuf")
    _ = graph.addVertex("Enjolras")
    _ = graph.addVertex("Combeferre")
    _ = graph.addVertex("Prouvaire")
    _ = graph.addVertex("Feuilly")
    _ = graph.addVertex("Courfeyrac")
    _ = graph.addVertex("Bahorel")
    _ = graph.addVertex("Bossuet")
    _ = graph.addVertex("Joly")
    _ = graph.addVertex("Grantaire")
    _ = graph.addVertex("MotherPlutarch")
    _ = graph.addVertex("Gueulemer")
    _ = graph.addVertex("Babet")
    _ = graph.addVertex("Claquesous")
    _ = graph.addVertex("Montparnasse")
    _ = graph.addVertex("Toussaint")
    _ = graph.addVertex("Child1")
    _ = graph.addVertex("Child2")
    _ = graph.addVertex("Brujon")
    _ = graph.addVertex("Mme.Hucheloup")
    
    graph.addEdge(from: "Napoleon", to: "Myriel")
    graph.addEdge(from: "Mlle.Baptistine", to: "Myriel")
    graph.addEdge(from: "Mme.Magloire", to: "Myriel")
    graph.addEdge(from: "Mme.Magloire", to: "Mlle.Baptistine")
    graph.addEdge(from: "CountessdeLo", to: "Myriel")
    graph.addEdge(from: "Geborand", to: "Myriel")
    graph.addEdge(from: "Champtercier", to: "Myriel")
    graph.addEdge(from: "Cravatte", to: "Myriel")
    graph.addEdge(from: "Count", to: "Myriel")
    graph.addEdge(from: "OldMan", to: "Myriel")
    graph.addEdge(from: "Valjean", to: "Labarre")
    graph.addEdge(from: "Valjean", to: "Mme.Magloire")
    graph.addEdge(from: "Valjean", to: "Mlle.Baptistine")
    graph.addEdge(from: "Valjean", to: "Myriel")
    graph.addEdge(from: "Marguerite", to: "Valjean")
    graph.addEdge(from: "Mme.deR", to: "Valjean")
    graph.addEdge(from: "Isabeau", to: "Valjean")
    graph.addEdge(from: "Gervais", to: "Valjean")
    graph.addEdge(from: "Listolier", to: "Tholomyes")
    graph.addEdge(from: "Fameuil", to: "Tholomyes")
    graph.addEdge(from: "Fameuil", to: "Listolier")
    graph.addEdge(from: "Blacheville", to: "Tholomyes")
    graph.addEdge(from: "Blacheville", to: "Listolier")
    graph.addEdge(from: "Blacheville", to: "Fameuil")
    graph.addEdge(from: "Favourite", to: "Tholomyes")
    graph.addEdge(from: "Favourite", to: "Listolier")
    graph.addEdge(from: "Favourite", to: "Fameuil")
    graph.addEdge(from: "Favourite", to: "Blacheville")
    graph.addEdge(from: "Dahlia", to: "Tholomyes")
    graph.addEdge(from: "Dahlia", to: "Listolier")
    graph.addEdge(from: "Dahlia", to: "Fameuil")
    graph.addEdge(from: "Dahlia", to: "Blacheville")
    graph.addEdge(from: "Dahlia", to: "Favourite")
    graph.addEdge(from: "Zephine", to: "Tholomyes")
    graph.addEdge(from: "Zephine", to: "Listolier")
    graph.addEdge(from: "Zephine", to: "Fameuil")
    graph.addEdge(from: "Zephine", to: "Blacheville")
    graph.addEdge(from: "Zephine", to: "Favourite")
    graph.addEdge(from: "Zephine", to: "Dahlia")
    graph.addEdge(from: "Fantine", to: "Tholomyes")
    graph.addEdge(from: "Fantine", to: "Listolier")
    graph.addEdge(from: "Fantine", to: "Fameuil")
    graph.addEdge(from: "Fantine", to: "Blacheville")
    graph.addEdge(from: "Fantine", to: "Favourite")
    graph.addEdge(from: "Fantine", to: "Dahlia")
    graph.addEdge(from: "Fantine", to: "Zephine")
    graph.addEdge(from: "Fantine", to: "Marguerite")
    graph.addEdge(from: "Fantine", to: "Valjean")
    graph.addEdge(from: "Mme.Thenardier", to: "Fantine")
    graph.addEdge(from: "Mme.Thenardier", to: "Valjean")
    graph.addEdge(from: "Thenardier", to: "Mme.Thenardier")
    graph.addEdge(from: "Thenardier", to: "Fantine")
    graph.addEdge(from: "Thenardier", to: "Valjean")
    graph.addEdge(from: "Cosette", to: "Mme.Thenardier")
    graph.addEdge(from: "Cosette", to: "Valjean")
    graph.addEdge(from: "Cosette", to: "Tholomyes")
    graph.addEdge(from: "Cosette", to: "Thenardier")
    graph.addEdge(from: "Javert", to: "Valjean")
    graph.addEdge(from: "Javert", to: "Fantine")
    graph.addEdge(from: "Javert", to: "Thenardier")
    graph.addEdge(from: "Javert", to: "Mme.Thenardier")
    graph.addEdge(from: "Javert", to: "Cosette")
    graph.addEdge(from: "Fauchelevent", to: "Valjean")
    graph.addEdge(from: "Fauchelevent", to: "Javert")
    graph.addEdge(from: "Bamatabois", to: "Fantine")
    graph.addEdge(from: "Bamatabois", to: "Javert")
    graph.addEdge(from: "Bamatabois", to: "Valjean")
    graph.addEdge(from: "Perpetue", to: "Fantine")
    graph.addEdge(from: "Simplice", to: "Perpetue")
    graph.addEdge(from: "Simplice", to: "Valjean")
    graph.addEdge(from: "Simplice", to: "Fantine")
    graph.addEdge(from: "Simplice", to: "Javert")
    graph.addEdge(from: "Scaufflaire", to: "Valjean")
    graph.addEdge(from: "Woman1", to: "Valjean")
    graph.addEdge(from: "Woman1", to: "Javert")
    graph.addEdge(from: "Judge", to: "Valjean")
    graph.addEdge(from: "Judge", to: "Bamatabois")
    graph.addEdge(from: "Champmathieu", to: "Valjean")
    graph.addEdge(from: "Champmathieu", to: "Judge")
    graph.addEdge(from: "Champmathieu", to: "Bamatabois")
    graph.addEdge(from: "Brevet", to: "Judge")
    graph.addEdge(from: "Brevet", to: "Champmathieu")
    graph.addEdge(from: "Brevet", to: "Valjean")
    graph.addEdge(from: "Brevet", to: "Bamatabois")
    graph.addEdge(from: "Chenildieu", to: "Judge")
    graph.addEdge(from: "Chenildieu", to: "Champmathieu")
    graph.addEdge(from: "Chenildieu", to: "Brevet")
    graph.addEdge(from: "Chenildieu", to: "Valjean")
    graph.addEdge(from: "Chenildieu", to: "Bamatabois")
    graph.addEdge(from: "Cochepaille", to: "Judge")
    graph.addEdge(from: "Cochepaille", to: "Champmathieu")
    graph.addEdge(from: "Cochepaille", to: "Brevet")
    graph.addEdge(from: "Cochepaille", to: "Chenildieu")
    graph.addEdge(from: "Cochepaille", to: "Valjean")
    graph.addEdge(from: "Cochepaille", to: "Bamatabois")
    graph.addEdge(from: "Pontmercy", to: "Thenardier")
    graph.addEdge(from: "Boulatruelle", to: "Thenardier")
    graph.addEdge(from: "Eponine", to: "Mme.Thenardier")
    graph.addEdge(from: "Eponine", to: "Thenardier")
    graph.addEdge(from: "Anzelma", to: "Eponine")
    graph.addEdge(from: "Anzelma", to: "Thenardier")
    graph.addEdge(from: "Anzelma", to: "Mme.Thenardier")
    graph.addEdge(from: "Woman2", to: "Valjean")
    graph.addEdge(from: "Woman2", to: "Cosette")
    graph.addEdge(from: "Woman2", to: "Javert")
    graph.addEdge(from: "MotherInnocent", to: "Fauchelevent")
    graph.addEdge(from: "MotherInnocent", to: "Valjean")
    graph.addEdge(from: "Gribier", to: "Fauchelevent")
    graph.addEdge(from: "Mme.Burgon", to: "Jondrette")
    graph.addEdge(from: "Gavroche", to: "Mme.Burgon")
    graph.addEdge(from: "Gavroche", to: "Thenardier")
    graph.addEdge(from: "Gavroche", to: "Javert")
    graph.addEdge(from: "Gavroche", to: "Valjean")
    graph.addEdge(from: "Gillenormand", to: "Cosette")
    graph.addEdge(from: "Gillenormand", to: "Valjean")
    graph.addEdge(from: "Magnon", to: "Gillenormand")
    graph.addEdge(from: "Magnon", to: "Mme.Thenardier")
    graph.addEdge(from: "Mlle.Gillenormand", to: "Gillenormand")
    graph.addEdge(from: "Mlle.Gillenormand", to: "Cosette")
    graph.addEdge(from: "Mlle.Gillenormand", to: "Valjean")
    graph.addEdge(from: "Mme.Pontmercy", to: "Mlle.Gillenormand")
    graph.addEdge(from: "Mme.Pontmercy", to: "Pontmercy")
    graph.addEdge(from: "Mlle.Vaubois", to: "Mlle.Gillenormand")
    graph.addEdge(from: "Lt.Gillenormand", to: "Mlle.Gillenormand")
    graph.addEdge(from: "Lt.Gillenormand", to: "Gillenormand")
    graph.addEdge(from: "Lt.Gillenormand", to: "Cosette")
    graph.addEdge(from: "Marius", to: "Mlle.Gillenormand")
    graph.addEdge(from: "Marius", to: "Gillenormand")
    graph.addEdge(from: "Marius", to: "Pontmercy")
    graph.addEdge(from: "Marius", to: "Lt.Gillenormand")
    graph.addEdge(from: "Marius", to: "Cosette")
    graph.addEdge(from: "Marius", to: "Valjean")
    graph.addEdge(from: "Marius", to: "Tholomyes")
    graph.addEdge(from: "Marius", to: "Thenardier")
    graph.addEdge(from: "Marius", to: "Eponine")
    graph.addEdge(from: "Marius", to: "Gavroche")
    graph.addEdge(from: "BaronessT", to: "Gillenormand")
    graph.addEdge(from: "BaronessT", to: "Marius")
    graph.addEdge(from: "Mabeuf", to: "Marius")
    graph.addEdge(from: "Mabeuf", to: "Eponine")
    graph.addEdge(from: "Mabeuf", to: "Gavroche")
    graph.addEdge(from: "Enjolras", to: "Marius")
    graph.addEdge(from: "Enjolras", to: "Gavroche")
    graph.addEdge(from: "Enjolras", to: "Javert")
    graph.addEdge(from: "Enjolras", to: "Mabeuf")
    graph.addEdge(from: "Enjolras", to: "Valjean")
    graph.addEdge(from: "Combeferre", to: "Enjolras")
    graph.addEdge(from: "Combeferre", to: "Marius")
    graph.addEdge(from: "Combeferre", to: "Gavroche")
    graph.addEdge(from: "Combeferre", to: "Mabeuf")
    graph.addEdge(from: "Prouvaire", to: "Gavroche")
    graph.addEdge(from: "Prouvaire", to: "Enjolras")
    graph.addEdge(from: "Prouvaire", to: "Combeferre")
    graph.addEdge(from: "Feuilly", to: "Gavroche")
    graph.addEdge(from: "Feuilly", to: "Enjolras")
    graph.addEdge(from: "Feuilly", to: "Prouvaire")
    graph.addEdge(from: "Feuilly", to: "Combeferre")
    graph.addEdge(from: "Feuilly", to: "Mabeuf")
    graph.addEdge(from: "Feuilly", to: "Marius")
    graph.addEdge(from: "Courfeyrac", to: "Marius")
    graph.addEdge(from: "Courfeyrac", to: "Enjolras")
    graph.addEdge(from: "Courfeyrac", to: "Combeferre")
    graph.addEdge(from: "Courfeyrac", to: "Gavroche")
    graph.addEdge(from: "Courfeyrac", to: "Mabeuf")
    graph.addEdge(from: "Courfeyrac", to: "Eponine")
    graph.addEdge(from: "Courfeyrac", to: "Feuilly")
    graph.addEdge(from: "Courfeyrac", to: "Prouvaire")
    graph.addEdge(from: "Bahorel", to: "Combeferre")
    graph.addEdge(from: "Bahorel", to: "Gavroche")
    graph.addEdge(from: "Bahorel", to: "Courfeyrac")
    graph.addEdge(from: "Bahorel", to: "Mabeuf")
    graph.addEdge(from: "Bahorel", to: "Enjolras")
    graph.addEdge(from: "Bahorel", to: "Feuilly")
    graph.addEdge(from: "Bahorel", to: "Prouvaire")
    graph.addEdge(from: "Bahorel", to: "Marius")
    graph.addEdge(from: "Bossuet", to: "Marius")
    graph.addEdge(from: "Bossuet", to: "Courfeyrac")
    graph.addEdge(from: "Bossuet", to: "Gavroche")
    graph.addEdge(from: "Bossuet", to: "Bahorel")
    graph.addEdge(from: "Bossuet", to: "Enjolras")
    graph.addEdge(from: "Bossuet", to: "Feuilly")
    graph.addEdge(from: "Bossuet", to: "Prouvaire")
    graph.addEdge(from: "Bossuet", to: "Combeferre")
    graph.addEdge(from: "Bossuet", to: "Mabeuf")
    graph.addEdge(from: "Bossuet", to: "Valjean")
    graph.addEdge(from: "Joly", to: "Bahorel")
    graph.addEdge(from: "Joly", to: "Bossuet")
    graph.addEdge(from: "Joly", to: "Gavroche")
    graph.addEdge(from: "Joly", to: "Courfeyrac")
    graph.addEdge(from: "Joly", to: "Enjolras")
    graph.addEdge(from: "Joly", to: "Feuilly")
    graph.addEdge(from: "Joly", to: "Prouvaire")
    graph.addEdge(from: "Joly", to: "Combeferre")
    graph.addEdge(from: "Joly", to: "Mabeuf")
    graph.addEdge(from: "Joly", to: "Marius")
    graph.addEdge(from: "Grantaire", to: "Bossuet")
    graph.addEdge(from: "Grantaire", to: "Enjolras")
    graph.addEdge(from: "Grantaire", to: "Combeferre")
    graph.addEdge(from: "Grantaire", to: "Courfeyrac")
    graph.addEdge(from: "Grantaire", to: "Joly")
    graph.addEdge(from: "Grantaire", to: "Gavroche")
    graph.addEdge(from: "Grantaire", to: "Bahorel")
    graph.addEdge(from: "Grantaire", to: "Feuilly")
    graph.addEdge(from: "Grantaire", to: "Prouvaire")
    graph.addEdge(from: "MotherPlutarch", to: "Mabeuf")
    graph.addEdge(from: "Gueulemer", to: "Thenardier")
    graph.addEdge(from: "Gueulemer", to: "Valjean")
    graph.addEdge(from: "Gueulemer", to: "Mme.Thenardier")
    graph.addEdge(from: "Gueulemer", to: "Javert")
    graph.addEdge(from: "Gueulemer", to: "Gavroche")
    graph.addEdge(from: "Gueulemer", to: "Eponine")
    graph.addEdge(from: "Babet", to: "Thenardier")
    graph.addEdge(from: "Babet", to: "Gueulemer")
    graph.addEdge(from: "Babet", to: "Valjean")
    graph.addEdge(from: "Babet", to: "Mme.Thenardier")
    graph.addEdge(from: "Babet", to: "Javert")
    graph.addEdge(from: "Babet", to: "Gavroche")
    graph.addEdge(from: "Babet", to: "Eponine")
    graph.addEdge(from: "Claquesous", to: "Thenardier")
    graph.addEdge(from: "Claquesous", to: "Babet")
    graph.addEdge(from: "Claquesous", to: "Gueulemer")
    graph.addEdge(from: "Claquesous", to: "Valjean")
    graph.addEdge(from: "Claquesous", to: "Mme.Thenardier")
    graph.addEdge(from: "Claquesous", to: "Javert")
    graph.addEdge(from: "Claquesous", to: "Eponine")
    graph.addEdge(from: "Claquesous", to: "Enjolras")
    graph.addEdge(from: "Montparnasse", to: "Javert")
    graph.addEdge(from: "Montparnasse", to: "Babet")
    graph.addEdge(from: "Montparnasse", to: "Gueulemer")
    graph.addEdge(from: "Montparnasse", to: "Claquesous")
    graph.addEdge(from: "Montparnasse", to: "Valjean")
    graph.addEdge(from: "Montparnasse", to: "Gavroche")
    graph.addEdge(from: "Montparnasse", to: "Eponine")
    graph.addEdge(from: "Montparnasse", to: "Thenardier")
    graph.addEdge(from: "Toussaint", to: "Cosette")
    graph.addEdge(from: "Toussaint", to: "Javert")
    graph.addEdge(from: "Toussaint", to: "Valjean")
    graph.addEdge(from: "Child1", to: "Gavroche")
    graph.addEdge(from: "Child2", to: "Gavroche")
    graph.addEdge(from: "Child2", to: "Child1")
    graph.addEdge(from: "Brujon", to: "Babet")
    graph.addEdge(from: "Brujon", to: "Gueulemer")
    graph.addEdge(from: "Brujon", to: "Thenardier")
    graph.addEdge(from: "Brujon", to: "Gavroche")
    graph.addEdge(from: "Brujon", to: "Eponine")
    graph.addEdge(from: "Brujon", to: "Claquesous")
    graph.addEdge(from: "Brujon", to: "Montparnasse")
    graph.addEdge(from: "Mme.Hucheloup", to: "Bossuet")
    graph.addEdge(from: "Mme.Hucheloup", to: "Joly")
    graph.addEdge(from: "Mme.Hucheloup", to: "Grantaire")
    graph.addEdge(from: "Mme.Hucheloup", to: "Bahorel")
    graph.addEdge(from: "Mme.Hucheloup", to: "Courfeyrac")
    graph.addEdge(from: "Mme.Hucheloup", to: "Gavroche")
    graph.addEdge(from: "Mme.Hucheloup", to: "Enjolras")

    ////////////////////////////////////////////////////////////////////////////////////////////////
    
//    _ = graph.addVertex("V1")
//    _ = graph.addVertex("V2")
//    _ = graph.addVertex("V3")
//    _ = graph.addVertex("V4")
//    _ = graph.addVertex("V5")
//    _ = graph.addVertex("V6")
//    _ = graph.addVertex("V7")
//    _ = graph.addVertex("V8")
//    _ = graph.addVertex("V9")
//    _ = graph.addVertex("V10")
//    _ = graph.addVertex("V11")
//    _ = graph.addVertex("V12")
//    
//    
//    graph.addEdge(from: "V1", to: "V2")
//    graph.addEdge(from: "V1", to: "V3")
//    graph.addEdge(from: "V1", to: "V4")
//    graph.addEdge(from: "V1", to: "V5")
//    
//    graph.addEdge(from: "V2", to: "V3")
//    graph.addEdge(from: "V2", to: "V4")
//    graph.addEdge(from: "V2", to: "V5")
//    
//    graph.addEdge(from: "V3", to: "V4")
//    graph.addEdge(from: "V3", to: "V5")
//    graph.addEdge(from: "V3", to: "V6")
//    graph.addEdge(from: "V3", to: "V7")
//    
//    graph.addEdge(from: "V4", to: "V5")
//    graph.addEdge(from: "V4", to: "V6")
//    graph.addEdge(from: "V4", to: "V7")
//    
//    graph.addEdge(from: "V5", to: "V6")
//    graph.addEdge(from: "V5", to: "V7")
//    graph.addEdge(from: "V5", to: "V8")
//    graph.addEdge(from: "V5", to: "V9")
//    graph.addEdge(from: "V5", to: "V10")
//    
//    graph.addEdge(from: "V6", to: "V7")
//    graph.addEdge(from: "V6", to: "V9")
//    graph.addEdge(from: "V6", to: "V11")
//    graph.addEdge(from: "V6", to: "V12")
//    
//    graph.addEdge(from: "V7", to: "V8")
//    graph.addEdge(from: "V7", to: "V9")
//    graph.addEdge(from: "V7", to: "V10")
//    graph.addEdge(from: "V7", to: "V11")
//    graph.addEdge(from: "V7", to: "V12")
//    
//    graph.addEdge(from: "V8", to: "V9")
//    graph.addEdge(from: "V8", to: "V10")
//    
//    graph.addEdge(from: "V9", to: "V10")
//    graph.addEdge(from: "V9", to: "V11")
//    graph.addEdge(from: "V9", to: "V12")
//    
//    graph.addEdge(from: "V11", to: "V12")
    
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
}

