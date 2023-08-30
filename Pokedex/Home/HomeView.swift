import SwiftUI

struct HomeView: View {
    
    private var viewModel: HomeViewModelProtocol
    
    // All this have to be inside ViewModel
    private var data: [Int] = Array(1...30)
    private let colors: [Color] = [.red, .green, .blue, .yellow]
    
    private let adaptativeColumns = [
        GridItem(.adaptive(minimum: 180), spacing: -5)
    ]
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        NavigationView {
            
            ScrollView() {
                LazyVGrid(columns: adaptativeColumns, spacing: 10) {
                    
                    ForEach(data, id: \.self) { number in
                        
                        //Each Cell Configuration
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 180, height: 110)
                            .foregroundColor(.green)
                        
                            //Using the component created
                            .overlay {
                                
                                //Put Itens Horizontaly
                                HStack(spacing: 30) {
                                    
                                    VStack(spacing: 10) {
                                        Text("Bulbasaur")
                                        //Add Spacing Between Components
                                            .padding(.bottom, 10)
                                        
                                        Group {
                                            Text("Grass")
                                            Text("Poison")
                                        }
                                        .background {
                                            Capsule()
                                                .fill(.ultraThinMaterial)
                                                .padding(.horizontal, -10)
                                        }
                                        .font(.system(size: 12))
                                        
                                        
                                    }
                                    .foregroundColor(.white)
                                    ZStack {
                                        
                                        Image(systemName: "pencil")
                                            .font(.system(size: 50))
                                        
                                    }
                                }
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
