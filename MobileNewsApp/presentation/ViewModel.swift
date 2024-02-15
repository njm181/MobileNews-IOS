//
//  ViewModel.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 09/02/2024.
//

import Foundation

final class ViewModel {
    
    func executeApi(){
        var request = URLRequest(url: URL(string: "https://newsapi.org/v2/everything?q=bitcoin")!)
        request.addValue("Bearer 08cda04fa4f34524bace7a7d9db31851", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                // Manejar errores
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("Respuesta inválida del servidor")
                    return
                }
                
                // Verificar que hay datos
                guard let data = data else {
                    print("No se encontraron datos")
                    return
                }
                
                do {
                    // Parsear los datos JSON en un objeto de tipo Response
                    let response = try JSONDecoder().decode(Response.self, from: data)
                    // Obtener el array de artículos
                    let articles = response.articles
                    // Aquí puedes hacer lo que desees con el array de artículos
                    print(articles)
                } catch {
                    print("Error al parsear JSON: \(error)")
                }
            }
            
            task.resume()
    }
}

struct Response: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String
}
