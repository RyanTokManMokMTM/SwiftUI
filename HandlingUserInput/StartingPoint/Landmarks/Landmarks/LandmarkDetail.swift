/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData:UserData
    var landmark: Landmark

    var LandmarkIndex:Int {
        userData.Landmark.firstIndex(where:{$0.id == landmark.id})!
        
        //list.firstIndex check first index is == sth
        //$0 is the first parameter of the func ,in this case is mean landmark.id
        //$0 = first one ,$1 mean second!
    }
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                
                HStack{
                    Text(landmark.name)
                         .font(.title)
                     
                     Button(action: {
                         self.userData.Landmark[self.LandmarkIndex].isFavorite.toggle()
                        //toggle change to true or false! 
                     }){
                         if(self.userData.Landmark[self.LandmarkIndex].isFavorite){
                             Image(systemName: "star.fill")
                                 .foregroundColor(.yellow)
                                // .imageScale(.medium)
                         }
                         else{
                             Image(systemName: "star")
                                 .foregroundColor(.gray)
                                // .imageScale(.medium)
                         }
                     }
                }

                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
        .environmentObject(UserData())
    }
}
