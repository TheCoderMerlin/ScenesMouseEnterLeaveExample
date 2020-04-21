import Igis
import Scenes


class Circle : RenderableEntity, EntityMouseEnterHandler,  EntityMouseLeaveHandler {
    let strokeStyle = StrokeStyle(color:Color(.black))
    let standardFillStyle = FillStyle(color:Color(.gray))
    let highlightedFillStyle : FillStyle
    var circle : Ellipse
    var fillStyle : FillStyle
    
    init(radius:Int, color:Color) {
        circle = Ellipse(center:Point(), radiusX:radius, radiusY:radius, fillMode:.fillAndStroke)
        highlightedFillStyle = FillStyle(color:color)
        fillStyle = standardFillStyle
        super.init(name:"Circle")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        // Move circle to center
        circle.center = Point(x:canvasSize.width/2, y:canvasSize.height/2)

        dispatcher.registerEntityMouseEnterHandler(handler:self)
        dispatcher.registerEntityMouseLeaveHandler(handler:self)
    }

    override func teardown() {
        dispatcher.unregisterEntityMouseLeaveHandler(handler:self)
        dispatcher.unregisterEntityMouseEnterHandler(handler:self)
    }


    override func boundingRect() -> Rect {
        let topLeft = Point(x:circle.center.x - circle.radiusX, y:circle.center.y - circle.radiusY)
        let size = Size(width:circle.radiusX * 2, height:circle.radiusY * 2)
        return Rect(topLeft:topLeft, size:size)
    }

    override func hitTest(globalLocation:Point) -> Bool {
        return globalLocation.distance(to: circle.center) <= Double(circle.radiusX)
    }

    override func render(canvas:Canvas) {
        canvas.render(strokeStyle, fillStyle, circle)
    }

    func onEntityMouseEnter(globalLocation:Point) {
        fillStyle = highlightedFillStyle
    }

    func onEntityMouseLeave(globalLocation:Point) {
        fillStyle = standardFillStyle
    }
}
