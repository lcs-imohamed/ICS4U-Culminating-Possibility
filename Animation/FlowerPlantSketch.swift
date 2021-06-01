//
//  FlowerPlantSketch.swift
//  Animation
//
//  Created by Mohamed, Ilana on 2021-05-30.
//

import Foundation
import CanvasGraphics

class FlowerPlantSketch: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    //[----3F++F----F++F----F++F----4F++F----5F++F----F]
//    fffff[1--F++++F----f----F++++F----f----F++++F----f----F]

    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Turn on high performance
        canvas.highPerformance = true
        
        // Define the basic system
        var flowerPlant = LindenmayerSystem(axiom: "S",
                                            rules: [
                                                
                                        
                                                 "S" : [
                                                     Successor(odds: 1, text: """
                                                                                 
                                                                                 2FL
                                                                                 """),
                                                 ],
                                                 
                                                
                                                
                                                "L" : [
                                                    Successor(odds: 1, text: """
                                                                                                                            0[F--F+F--F+F--F+F--F+F--F+F--F]
                                                                               1[--F++F--f--F++F--f--F++F]

                                                                            """),
                                                    
                                                ],
                                                
                                                
                                                
                                                
                                            ],
                                            
                                            generations: 2)
        
        // Define the visualization
        var visualizedFlowerPlant = Visualizer(for: flowerPlant,
                                               on: canvas,
                                               length: 40,
                                               reduction: 2,
                                               angle: 60,
                                               initialPosition: Point(x: 100, y: 100),
                                               initialHeading: 90,
                                               colors: [
                                                "0" : LSColor.black,
                                                "1" : LSColor.green,
                                                "2" : LSColor.orange,
                                                "3" : LSColor.purple,
                                                "4" : LSColor.red,
                                                "5" : LSColor.yellow,
                                               ])
        
        //        // Make a few other versions of this plant
        //        var secondPlant = visualizedLeafyPlant
        //        var thirdPlant = visualizedLeafyPlant
        //
        //        // Slide position of those plants over
        //        secondPlant.initialPosition = Point(x: 250, y: 100)
        //        thirdPlant.initialPosition = Point(x: 400, y: 100)
        
        // Render the system
        visualizedFlowerPlant.render()
        
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        
    }
    
}
