//
//  LindemayerSystemSketch.swift
//  Animation
//
//  Created by Russell Gordon on 2021-05-04.
//

import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class LindenmayerSystemSketch: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Enable faster rendering
        canvas.highPerformance = true
        
        //Create background
        canvas.drawShapesWithBorders = false
                canvas.fillColor = Color(hue: 150, saturation: 90, brightness: 90, alpha: 80)
                canvas.drawRectangle(at: Point(x: 0, y: 0), width: canvas.width, height: canvas.height / 3 * 2)
                canvas.fillColor = .red
        
        
        
         // Load berry bush visualization
         var berryBush = Visualizer(fromJSONFile: "scott-berry-tree",
                                    drawingOn: self.canvas)
         berryBush.initialPosition = Point(x: 250, y: 75)
        berryBush.length = 10
         
         // Render the tree
         berryBush.render()
         
        
         // Load fernPlant
         var fernPlant = Visualizer(fromJSONFile: "ilana-fern-plant",
                                         drawingOn: self.canvas)
        fernPlant.reduction = 1.2
        fernPlant.initialPosition = Point(x: 100, y: 200)
        
         // Render fern plant
         fernPlant.render()
       
        
        // Load bush
        var bush = Visualizer(fromJSONFile: "victoria-bush", drawingOn: self.canvas)
        
        bush.initialPosition = Point(x: 300, y: 250)
        
        //render bush
        bush.render()
        
        // Load tree
        var tree = Visualizer(fromJSONFile: "gordon-basic-branching-tree", drawingOn: self.canvas)
        tree.initialPosition = Point(x: 450, y: 100)
         
        // render tree
        tree.render()

        
        
        // Load second berry bush
        
        var smallerBerryBush = Visualizer(fromJSONFile: "aidan-berry-bush", drawingOn: self.canvas)
        smallerBerryBush.initialPosition = Point(x: 100, y: 50)
        smallerBerryBush.reduction = 1.5
        
        smallerBerryBush.render()
        
        
     }

    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
    
}

