## Grocery-Database-Design

<h4>Description:</h4>
The database is designed to reach 3NF standards, with prime attributes <strong>(NF1 standard)</strong>, non-key attributes that are fully dependent on the primary key attribute 
<strong>(NF2 standard)</strong>, and non-key attributes that do not depend on another non-key attributes, but depend entirely on the primary key <strong>(NF3 standard)</strong>.

<h4>Relationships between objects:</h4>
<ul>
    <li>Employee - Product: Each Employee manages many Products. (Relationship: One-to-many)</li>
    <li>Product - Supplier: Each Product belongs to one Supplier. (Relationship: Many-to-one)</li>
    <li>Product - Unit: Each Product can have many different Units. (Relationship: One-to-many)</li>
    <li>SaleOrder - SaleOrderDetail: Each Sales Order has many Sales Order Details. (Relationship: One-to-many)</li>
    <li>Employee - SaleOrder: Each Sales Order is made by an Employee. (Relationship: One-to-many)</li>
    <li>Customer - SaleOrder: Each Sales Order is purchased by a Customer. (Relationship: One-to-many)</li>
    <li>PurchaseOrder - PurchaseOrderDetail: Each Purchase Order has many Purchase Order Details. (Relationship: One-to-many)</li>
    <li>Employee - Purchase Order: Each Purchase Order is made by an Employee. (Relationship: One-to-many)</li>
    <li>Supplier - Purchase Order: Each Purchase Order is provided by a Supplier. (Relationship: One-to-many)</li>
    <li>SaleOrder - Customer: Each Sales Order is associated with a Customer. (Relationship: Many-to-one)</li>
    <li>SaleOrderDetail - Product: Each Sales Order Detail is associated with a Product. (Relationship: Many-to-one)</li>
    <li>Purchase Order - Supplier: Each Purchase Order is associated with a Supplier. (Relationship: Many-to-one)</li>
    <li>PurchaseOrderDetail - Product: Each Purchase Order Detail is associated with a Product. (Relationship: Many-to-one)</li>
</ul>

<h4>List functional dependencies:</h4>
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
