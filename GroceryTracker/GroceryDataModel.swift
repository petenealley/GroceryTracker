//
//  GroceryDataModel.swift
//  GroceryTracker
//
//  Created by Pete Nealley on 2/25/25.
//
import Foundation
import SwiftData

/// Represents a category for grouping grocery items (e.g., "Meat", "Produce").
@Model
class Category {
    /// The name of the category.
    var name: String
    
    /// The list of grocery items belonging to this category.
    @Relationship(deleteRule: .cascade, inverse: \GroceryItem.category)
    var groceryItems: [GroceryItem]
    
    init(name: String) {
        self.name = name
        self.groceryItems = []
    }
}

/// Represents a grocery item with a name and a standard unit for price comparison.
@Model
class GroceryItem {
    /// The name of the grocery item (e.g., "Apple", "Milk").
    var name: String
    
    /// The standard unit for price normalization (e.g., "each", "kg", "liter").
    var standardUnit: String
    
    /// The category this grocery item belongs to.
//    @Relationship(inverse: \Category.groceryItems)
    var category: Category
    
    /// The list of price records for this grocery item.
//    @Relationship(deleteRule: .cascade, inverse: \PriceRecord.groceryItem)
    var priceRecords: [PriceRecord]
    
    init(name: String, standardUnit: String, category: Category) {
        self.name = name
        self.standardUnit = standardUnit
        self.category = category
        self.priceRecords = []
    }
}

/// Represents a record of a price for a grocery item at a specific store and date.
@Model
class PriceRecord {
    /// The price per standard unit of the grocery item.
    var pricePerUnit: Double
    
    /// The date when the price was recorded.
    var date: Date
    
    /// The store where the price was recorded.
    @Relationship(deleteRule: .cascade, inverse: \Store.priceRecords)
    var store: Store
    
    /// The grocery item this price record is for.
    @Relationship(deleteRule: .cascade, inverse: \GroceryItem.priceRecords)
    var groceryItem: GroceryItem
    
    /// The optional brand of the grocery item.
    var brand: String?
    
    init(pricePerUnit: Double, date: Date, store: Store, groceryItem: GroceryItem, brand: String? = nil) {
        self.pricePerUnit = pricePerUnit
        self.date = date
        self.store = store
        self.groceryItem = groceryItem
        self.brand = brand
    }
}

/// Represents a specific store location.
@Model
class Store {
    /// The location of the store (e.g., "123 Main St").
    var location: String
    
    /// The chain this store belongs to.
//    @Relationship(deleteRule: .cascade, inverse: \Chain.stores)
    var chain: Chain
    
    /// The list of price records recorded at this store.
//    @Relationship(deleteRule: .cascade, inverse: \PriceRecord.store)
    var priceRecords: [PriceRecord]
    
    init(location: String, chain: Chain) {
        self.location = location
        self.chain = chain
        self.priceRecords = []
    }
}

/// Represents a chain of stores (e.g., "Walmart", "Safeway").
@Model
class Chain {
    /// The name of the chain.
    var name: String
    
    /// The list of stores belonging to this chain.
    @Relationship(deleteRule: .cascade, inverse: \Store.chain)
    var stores: [Store]
    
    init(name: String) {
        self.name = name
        self.stores = []
    }
}
