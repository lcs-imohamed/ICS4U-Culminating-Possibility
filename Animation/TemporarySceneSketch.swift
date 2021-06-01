

import Foundation
import CanvasGraphics

class TemporarySceneSketch: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        //Create canvas background
        canvas.fillColor = Color(hue: 209, saturation: 55, brightness: 94, alpha: 100)
        canvas.drawRectangle(at: Point(x: 0, y: 250), width: canvas.width, height: canvas.height / 2)
        canvas.fillColor = Color(hue: 90, saturation: 46, brightness: 60, alpha: 100)
        canvas.drawRectangle(at: Point(x: 0, y: 0), width: canvas.width, height: canvas.height / 2)
       
    
        //Draw circle to be a pond
        canvas.fillColor = Color(hue: 182, saturation: 100, brightness: 86, alpha: 100)
        canvas.drawEllipse(at: Point(x: 150, y: 50), width: 400, height: 100)
        
        canvas.fillColor = .black
        
        //Turn on high performance mode
        canvas.highPerformance = true
        
        //Load cattail
        var cattail = Visualizer(fromJSONFile: "aidan-Cattail-sketch",
                                 drawingOn: canvas)
        
        //Move cattail
        cattail.initialPosition = Point(x: 50, y: 100)

        //render cattail
        cattail.render()
        
       //Make cat tail that appears in random locations around pond
        
        for x in stride(from: 1.0, through: 300.0, by: 50.0) {
            
            //Define y using quadratic relation
            let a = 6.0
            let c = 50.0
            let y = a * x * x + c
            
            
            cattail.initialPosition = Point(x: Double(x), y: Double(y))
            
            cattail.render()
            
            cattail.initialPosition = Point(x: Double(x), y: Double(y))
            
            cattail.render()
            
            
        }
        
     
        
        //load fernanda plant
        var plant = Visualizer(fromJSONFile: "Fernanda-Plan2", drawingOn: canvas)
        
        //Move plant
        plant.initialPosition = Point(x: 450, y: 50)
        
       
        
        //render plant
        plant.render()
        
        //load flower plant
        var flowerPlant = Visualizer(fromJSONFile: "ilana-flower-plant", drawingOn: canvas)
        
        flowerPlant.initialPosition = Point(x: 150, y: 200)
        
        //render plant
        flowerPlant.render()
        
        
        //load berry bush
        var berryBush = Visualizer(fromJSONFile: "scott-berry-tree", drawingOn: canvas)
        
        //Make bush smaller
        berryBush.reduction = 1.25
        
        //move berry bush
        berryBush.initialPosition = Point(x: 200, y: 110)
    
        //render berry bush
        berryBush.render()
        
    }
    
    
    
    
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
      
        
        
        
    }
    
}
