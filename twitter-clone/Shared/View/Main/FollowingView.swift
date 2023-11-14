import SwiftUI

// Modèle de données pour les followings
class FollowingViewModel: ObservableObject {
    @Published var followings: [String] = []

    // Fonction pour charger les followings
    func loadFollowings(userId: String) {
        // Ici, vous devez appeler votre API pour obtenir les followings
        // Utilisez URLSession pour faire une requête HTTP à votre API
        // Mettez à jour la propriété `followings` avec les données reçues
    }
}

struct FollowingView: View {
    @StateObject var viewModel = FollowingViewModel()

    var body: some View {
        List(viewModel.followings, id: \.self) { following in
            Text(following)
        }
        .onAppear {
            // Remplacez 'userId' par l'ID de l'utilisateur actuel
            viewModel.loadFollowings(userId: "userId")
        }
    }
}

struct FollowingView_Previews: PreviewProvider {
    static var previews: some View {
        FollowingView()
    }
}
