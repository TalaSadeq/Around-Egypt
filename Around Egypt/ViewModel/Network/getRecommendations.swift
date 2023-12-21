import Foundation

protocol RecommendationsDelegate: AnyObject {
    func didFetchRecommendations()
}

var datacount = 0
var recommendations : Response?

class APIManager {
    weak var delegate: RecommendationsDelegate?

    func fetchRecommendations() {
        let url = "https://aroundegypt.34ml.com/api/v2/experiences?filter[recommended]=true"

        URLSession.shared.dataTask(with: URL(string:url)!, completionHandler: { data, response, error in
            guard let data = data , error == nil else {
                print("Something Went wrong")
                return
            }
            var result : Response?
            do {
                result = try JSONDecoder().decode(Response.self,from: data)
                DispatchQueue.main.async {
                    recommendations = result
                    datacount = result?.data.count ?? 0
                    print(datacount)
                    // Notify delegate or completion handler that data is fetched
                    self.delegate?.didFetchRecommendations()
                }
            } catch {
                print(error)
            }
            guard let json = result else {
                return
            }
            print(json.meta?.code!)
        }).resume()
    }
}

