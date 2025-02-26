//
//  DataModel Explanation.swift
//  GroceryTracker
//
//  Created by Pete Nealley on 2/25/25.
//

//Entity Descriptions and Relationships
//Category
//Attributes: name (String)
//Relationships: Has a one-to-many relationship with GroceryItem (groceryItems). Deleting a Category will cascade delete its associated GroceryItems.
//GroceryItem
//Attributes: name (String), standardUnit (String)
//Relationships: Belongs to one Category (category) and has a one-to-many relationship with PriceRecord (priceRecords). Deleting a GroceryItem will cascade delete its associated PriceRecords.
//PriceRecord
//Attributes: pricePerUnit (Double), date (Date), brand (optional String)
//Relationships: Belongs to one Store (store) and one GroceryItem (groceryItem). Deleting either the Store or GroceryItem will cascade delete the PriceRecord.
//Store
//Attributes: location (String)
//Relationships: Belongs to one Chain (chain) and has a one-to-many relationship with PriceRecord (priceRecords). Deleting a Store will cascade delete its associated PriceRecords.
//Chain
//Attributes: name (String)
//Relationships: Has a one-to-many relationship with Store (stores). Deleting a Chain will cascade delete its associated Stores (and subsequently their PriceRecords via the cascading rule).
//Notes
//The @Relationship macro is used to define relationships between entities, with the inverse parameter specifying the corresponding property in the related entity.
//The deleteRule: .cascade ensures that deleting a parent entity removes its dependent entities, maintaining data consistency.
//Initializers are provided for clarity, though SwiftData generates default initializers automatically.
//                                The brand attribute in PriceRecord is optional, allowing for cases where the brand is unspecified.
//This code provides a complete and robust data model for tracking grocery prices across stores and chains, suitable for use with SwiftData.

