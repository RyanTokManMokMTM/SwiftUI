import SwiftUI

struct Draw2D: View {
    var body: some View {
        
        GeometryReader{ geometry in
            
            Path{ path in
                var width:CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale:CGFloat = 0.832
                let xOffset = width * (1-xScale)/2
                width *= xScale
                path.move(to: CGPoint(x: xOffset+width * 0.95, y: height*(0.20 + HexagonParameters.adjustment)))
                
                HexagonParameters.points.forEach{
                    path.addLine(to: .init(x: xOffset + width * $0.useWidth.0 * $0.xFactors.0, y: height * $0.useHeight.0 * $0.yFactors.0))
                    
                    // draw the coner
                    path.addQuadCurve(to: .init(
                        x: xOffset + width * $0.useWidth.1 * $0.xFactors.1, y: height * $0.useHeight.1 * $0.yFactors.1)
                        , control: .init(x: xOffset + width * $0.useWidth.2 * $0.xFactors.2, y: height * $0.useHeight.2 * $0.yFactors.2))
                    }
                
                }
            .fill(LinearGradient(gradient: .init(colors: [Self.geadientStart,Self.geadientEnd]), startPoint: .init(x: 0.5, y: 0), endPoint: .init(x: 0.5, y: 0.6)))
            .aspectRatio(1, contentMode: .fit)
            }
            
        }
    static let geadientStart = Color(red:239.0/255,green:120.0/255,blue:221.0/255)
    static let geadientEnd = Color(red:239.0/255,green:172.0/255,blue:120.0/255)
    }


struct Draw2D_Previews: PreviewProvider {
    static var previews: some View {
        Draw2D()
    }
}
