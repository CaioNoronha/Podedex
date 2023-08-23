import SwiftUI

struct HomeView: View {
    
    private var viewModel: HomeViewModelProtocol
    
    // All this have to be inside ViewModel
    private var data: [Int] = Array(1...30)
    private let colors: [Color] = [.red, .green, .blue, .yellow]
    
    private let adaptativeColumns = [
        GridItem(.adaptive(minimum: 150), spacing: -10)
    ]
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        NavigationView {
            
            ScrollView() {
                LazyVGrid(columns: adaptativeColumns, spacing: 10) {
                    
                    ForEach(data, id: \.self) { number in
                        // \.self just work because the data is identiafle
                        //Create a component like a cell,
                        //Change hardcoded values
                        //Font can be padron
                        ZStack {
                            Rectangle()
                                .frame(width: 180, height: 130)
                                .foregroundColor(colors[number%4])
                                .cornerRadius(30)
                            
                            Text("Bulbasaur")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                        }
                    }
                }
            }
            .navigationTitle("Pokedex")
            
            
            .toolbar() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Opa")
                    } label: {
                        Image(systemName: "list.dash")
                    }

                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
