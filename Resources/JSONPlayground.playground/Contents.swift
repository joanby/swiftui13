import UIKit

let myJson = """
{
    "fruits": [
    {
        "fruit": "Apple",
        "size": "Large",
        "color": "Red",
        "price": 2,
        "location":{
            "country": "Brasil"
        }
    },
    {
        "fruit": "Banana",
        "size": "Medium",
        "color": "Yellow",
        "price": 1,
        "location":{
            "country": "Canarias"
        }
    }
    ]
}
"""

struct FruitStore: Codable {
    var fruits: [Fruit]
}

struct Fruit : Codable {
    var name: String
    var size: String
    var color: String
    var price: Int
    var country: String
    
    enum CodingKeys: String, CodingKey{
        case name = "fruit"
        case size
        case color
        case price
        case country = "location"
    }
    
    enum LocationKeys: String, CodingKey{
        case country
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try values.decode(String.self, forKey: .name)
        self.size = try values.decode(String.self, forKey: .size)
        self.color = try values.decode(String.self, forKey: .color)
        self.price = try values.decode(Int.self, forKey: .price)
        
        let location = try values.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        self.country = try location.decode(String.self, forKey: .country)
    }
}


let decoder = JSONDecoder()

if let jsonData = myJson.data(using: .utf8){
    do{
        let fruitStore = try decoder.decode(FruitStore.self, from: jsonData)
        
        for fruit in fruitStore.fruits {
            print(fruit)
        }
    }catch {
        print(error)
    }
}
