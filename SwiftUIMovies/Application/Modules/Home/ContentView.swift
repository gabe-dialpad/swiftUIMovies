import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var viewModel = MovieViewModel()
        
    var body: some View {
        
        VStack {
            Text("Hello, Movies!")
                .padding()
                            
            List(viewModel.movies, id: \.id) { item in
                   VStack(alignment: .leading) {
                        Text(item.title)
                           .font(.headline)
                        Text(item.overview)
                   }
            }
            
            
        }.onAppear {
            viewModel.upcoming(page: "1")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
