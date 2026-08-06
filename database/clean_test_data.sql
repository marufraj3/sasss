-- DANGER: This permanently deletes current commerce data.
-- Import ONLY after a verified backup and after running all Laravel migrations.
-- This keeps one test admin, one test customer, 3 fashion categories and 6 test products.

SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE product_events;
TRUNCATE TABLE abandoned_carts;
TRUNCATE TABLE wishlists;
TRUNCATE TABLE return_requests;
TRUNCATE TABLE courier_shipments;
TRUNCATE TABLE product_recommendations;
TRUNCATE TABLE campaigns_products;
TRUNCATE TABLE campaign_reviews;
TRUNCATE TABLE campaigns;
TRUNCATE TABLE coupons;
TRUNCATE TABLE customer_customer_tag;
TRUNCATE TABLE customer_tags;
TRUNCATE TABLE payments;
TRUNCATE TABLE shippings;
TRUNCATE TABLE order_details;
TRUNCATE TABLE orders;
TRUNCATE TABLE productcolors;
TRUNCATE TABLE productsizes;
TRUNCATE TABLE productimages;
TRUNCATE TABLE products;
TRUNCATE TABLE colors;
TRUNCATE TABLE sizes;
TRUNCATE TABLE brands;
TRUNCATE TABLE childcategories;
TRUNCATE TABLE subcategories;
TRUNCATE TABLE categories;
TRUNCATE TABLE customers;
TRUNCATE TABLE users;
TRUNCATE TABLE contacts;
TRUNCATE TABLE social_media;
TRUNCATE TABLE banners;
TRUNCATE TABLE banner_categories;
TRUNCATE TABLE create_pages;
TRUNCATE TABLE shipping_promotions;
TRUNCATE TABLE payment_gateways;
TRUNCATE TABLE sms_gateways;
TRUNCATE TABLE courierapis;
TRUNCATE TABLE ecom_pixels;
TRUNCATE TABLE google_tag_managers;
TRUNCATE TABLE general_settings;
SET FOREIGN_KEY_CHECKS=1;

INSERT INTO users (id,name,email,password,image,status,created_at,updated_at) VALUES
(1,'Test Admin','admin@test.local','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','public/uploads/default/user.png',1,NOW(),NOW());
-- Test login password: password. Change it immediately after first login.

INSERT INTO customers (id,name,slug,phone,email,password,verify,status,image,created_at,updated_at) VALUES
(1,'Test Customer','test-customer','01700000000',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',1,'active','public/uploads/default/user.png',NOW(),NOW());

INSERT INTO general_settings (id,name,white_logo,dark_logo,favicon,copyright,status,primary_color,secondary_color,hotline,whatsapp,footer_text,delivery_policy,return_policy,created_at,updated_at) VALUES
(1,'Test Fashion Store','public/uploads/settings/placeholder-logo.png','public/uploads/settings/placeholder-logo.png','public/uploads/settings/placeholder-logo.png','© Test Fashion Store',1,'#111111','#ffffff',NULL,NULL,'© Test Fashion Store',NULL,NULL,NOW(),NOW());

INSERT INTO banner_categories (id,name,status,created_at,updated_at) VALUES (1,'Homepage',1,NOW(),NOW());
INSERT INTO categories (id,name,slug,parent_id,image,front_view,status,created_at,updated_at) VALUES
(1,'Men','men',0,'public/uploads/category/default.png',1,1,NOW(),NOW()),
(2,'Women','women',0,'public/uploads/category/default.png',1,1,NOW(),NOW()),
(3,'Winter Collection','winter-collection',0,'public/uploads/category/default.png',1,1,NOW(),NOW());
INSERT INTO sizes (id,sizeName,status,created_at,updated_at) VALUES (1,'M','1',NOW(),NOW()),(2,'L','1',NOW(),NOW()),(3,'XL','1',NOW(),NOW());
INSERT INTO colors (id,colorName,color,status,created_at,updated_at) VALUES (1,'Black','#111111','1',NOW(),NOW()),(2,'White','#ffffff','1',NOW(),NOW());
INSERT INTO brands (id,name,name_bn,slug,image,status,created_at,updated_at) VALUES (1,'Test Brand','টেস্ট ব্র্যান্ড','test-brand','public/uploads/category/default.png',1,NOW(),NOW());
INSERT INTO products (id,name,slug,category_id,brand_id,product_code,purchase_price,old_price,new_price,stock,pro_unit,topsale,feature_product,status,created_at,updated_at) VALUES
(1,'Classic Black Panjabi','classic-black-panjabi',1,1,'TEST-001',700,1490,1190,12,'Piece',1,1,1,NOW(),NOW()),
(2,'Premium White Panjabi','premium-white-panjabi',1,1,'TEST-002',750,1590,1290,8,'Piece',1,1,1,NOW(),NOW()),
(3,'Women Black Kurti','women-black-kurti',2,1,'TEST-003',650,1390,1090,10,'Piece',1,1,1,NOW(),NOW()),
(4,'Women White Kurti','women-white-kurti',2,1,'TEST-004',650,1390,1090,7,'Piece',0,1,1,NOW(),NOW()),
(5,'Winter Hoodie Black','winter-hoodie-black',3,1,'TEST-005',800,1790,1390,15,'Piece',1,0,1,NOW(),NOW()),
(6,'Winter Hoodie White','winter-hoodie-white',3,1,'TEST-006',800,1790,1390,5,'Piece',0,0,1,NOW(),NOW());
INSERT INTO productimages (product_id,image,created_at,updated_at) VALUES
(1,'public/uploads/default/product.png',NOW(),NOW()),(2,'public/uploads/default/product.png',NOW(),NOW()),(3,'public/uploads/default/product.png',NOW(),NOW()),(4,'public/uploads/default/product.png',NOW(),NOW()),(5,'public/uploads/default/product.png',NOW(),NOW()),(6,'public/uploads/default/product.png',NOW(),NOW());
INSERT INTO productsizes (product_id,size_id,created_at,updated_at) VALUES
(1,1,NOW(),NOW()),(1,2,NOW(),NOW()),(1,3,NOW(),NOW()),(2,1,NOW(),NOW()),(2,2,NOW(),NOW()),(2,3,NOW(),NOW()),(3,1,NOW(),NOW()),(3,2,NOW(),NOW()),(3,3,NOW(),NOW());
INSERT INTO productcolors (product_id,color_id,created_at,updated_at) VALUES
(1,1,NOW(),NOW()),(2,2,NOW(),NOW()),(3,1,NOW(),NOW()),(4,2,NOW(),NOW()),(5,1,NOW(),NOW()),(6,2,NOW(),NOW());
INSERT INTO order_statuses (id,name,slug,status,created_at,updated_at) VALUES
(1,'Pending','pending','1',NOW(),NOW()),(2,'Processing','processing','1',NOW(),NOW()),(3,'On The Way','on-the-way','1',NOW(),NOW()),(4,'On Hold','on-hold','1',NOW(),NOW()),(5,'In Courier','in-courier','1',NOW(),NOW()),(6,'Completed','completed','1',NOW(),NOW()),(7,'Cancelled','cancelled','1',NOW(),NOW())
ON DUPLICATE KEY UPDATE name=VALUES(name),slug=VALUES(slug),status=VALUES(status);
INSERT INTO shipping_charges (id,name,amount,status,created_at,updated_at) VALUES
(1,'Inside Dhaka',70,'1',NOW(),NOW()),(2,'Outside Dhaka',130,'1',NOW(),NOW())
ON DUPLICATE KEY UPDATE name=VALUES(name),amount=VALUES(amount),status=VALUES(status);
