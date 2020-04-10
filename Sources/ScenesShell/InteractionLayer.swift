import Igis
import Scenes

  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer {

      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")
      }

      override func preSetup(canvasSize:Size, canvas:Canvas) {
          let colors = [Color(.violet), Color(.indigo), Color(.blue), Color(.green), Color(.yellow), Color(.orange), Color(.red)]
          var radius = min(canvasSize.height, canvasSize.width) / 2
          let radiusDelta = radius / colors.count

          for color in colors {
              insert(entity:Circle(radius:radius, color:color), at:.front)
              radius -= radiusDelta
          }
          
      }
  }
