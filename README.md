# Grocery-Database-Design

Description:
The database is designed to meet NF3 standards, with prime attributes (NF1 standard), 
non-key attributes that are fully functionally dependent on the primary key attribute 
(NF2 standard), and non-key attributes that do not depend on the primary key attribute 
(NF2 standard). on another non-key attribute, but depends entirely on the primary key 
(NF3 standard).

Relationships between objects:
• Employee - Product: Each Employee manages many Product. (Relationship: One-to-many)
• Product - Supplier: Each Product belongs to one Supplier. (Relationship: Many-to-one)
• Product - Unit: Each Product can have many different Units. (Relationship: One-to-many)
• SaleOrder - SaleOrderDetail: Each Sales Order has many Sales Order Details. (Relationship: One-to-many)
• Employee - SaleOrder: Each Sales Order is made by an Employee. (Relationship: One-to-many)
• Customer - SaleOrder: Each Sales Order is purchased by a Customer. (Relationship: One-to-many)
• PurchaseOrder - PurchaseOrderDetail: Each Purchase Order has many Purchase Order Details. (Relationship: One-to-many)
• Employee - PurchaseOrder: Each Purchase Order is made by an Employee. (Relationship: One-to-many)
• Supplier - PurchaseOrder: Each Purchase Order is provided by a Supplier. (Relationship: One-to-many)
• SaleOrder - Customer: Each Sales Order is associated with a Customer. (Relationship: Many-to-one)
• SaleOrderDetail - Product: Each Sales Order Detail is associated with a Product. (Relationship: Many-to-one)
• PurchaseOrder - Supplier: Each Purchase Order is associated with a Supplier. (Relationship: Many-to-one)
• PurchaseOrderDetail - Product: Each Purchase Order Detail is associated with a Product. (Relationship: Many-to-one)

List functional dependencies:
• Table Products
    product_id → product_name, barcode, purchase_price, selling_price, last_updated
    purchase_price, selling_price → avg_price
• Table Units
    unit_id → unit_name, quantity
    unit_name, quantity, product_id → purchase_price, selling_price
• Table Suppliers
    supplier_id → name, phone, zip_code, street_address, city, country
• Table Customers
    customer_id → name, phone, zip_code, street_address, city, country
• Table Employees
    employee_id → name, phone, zip_code, street_address, city, country, username, password
• Table PurchaseOrder
    purchase_order_id → pur_date, employee_id, supplier_id, total_price
• Table PurchaseOrderDetail
    purchase_order_detail_id → quantity, purchase_price, purchase_order_id
    quantity, purchase_price, product_id → total_amount
• Table SaleOrder
    sale_order_id → sale_date, employee_id, customer_id, total_price
• Table SaleOrderDetail
    sale_order_detail_id → quantity, purchase_price, selling_price, sale_order_id
    quantity, selling_price, product_id → total_amount