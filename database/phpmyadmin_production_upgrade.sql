-- Arza Mart production schema upgrade
-- Import this AFTER importing the legacy smmpawc1_titu dump.
-- Requires MySQL 8+ or a recent MariaDB version supporting ADD COLUMN IF NOT EXISTS.
-- Take a database backup before importing.

SET NAMES utf8mb4;

ALTER TABLE orders
  ADD COLUMN IF NOT EXISTS admin_note TEXT NULL,
  ADD COLUMN IF NOT EXISTS user_id INT UNSIGNED NULL,
  ADD COLUMN IF NOT EXISTS note VARCHAR(256) NULL,
  ADD COLUMN IF NOT EXISTS order_page VARCHAR(120) NULL,
  ADD COLUMN IF NOT EXISTS utm_source VARCHAR(120) NULL,
  ADD COLUMN IF NOT EXISTS office_note TEXT NULL;
ALTER TABLE order_details
  ADD COLUMN IF NOT EXISTS product_discount INT NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS product_size VARCHAR(255) NULL,
  ADD COLUMN IF NOT EXISTS product_color VARCHAR(255) NULL;
ALTER TABLE payments
  ADD COLUMN IF NOT EXISTS paid_amount INT UNSIGNED NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS due_amount INT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE categories
  ADD COLUMN IF NOT EXISTS front_view TINYINT(1) NULL,
  ADD COLUMN IF NOT EXISTS meta_description TEXT NULL;
ALTER TABLE customers MODIFY email VARCHAR(55) NULL;
ALTER TABLE campaigns
  ADD COLUMN IF NOT EXISTS banner_title VARCHAR(255) NULL,
  ADD COLUMN IF NOT EXISTS banner VARCHAR(255) NULL,
  ADD COLUMN IF NOT EXISTS video VARCHAR(255) NULL,
  ADD COLUMN IF NOT EXISTS product_id BIGINT UNSIGNED NULL,
  ADD COLUMN IF NOT EXISTS cta_text VARCHAR(80) NULL,
  ADD COLUMN IF NOT EXISTS starts_at TIMESTAMP NULL,
  ADD COLUMN IF NOT EXISTS ends_at TIMESTAMP NULL,
  ADD COLUMN IF NOT EXISTS faq_items JSON NULL;

CREATE TABLE IF NOT EXISTS campaigns_products (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, campaign_id INT UNSIGNED NOT NULL, product_id BIGINT UNSIGNED NOT NULL, sort_order INT UNSIGNED NOT NULL DEFAULT 0,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, UNIQUE KEY campaigns_products_campaign_product_unique (campaign_id, product_id), KEY campaigns_products_campaign_sort_index (campaign_id, sort_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE campaigns_products ADD COLUMN IF NOT EXISTS sort_order INT UNSIGNED NOT NULL DEFAULT 0;

CREATE TABLE IF NOT EXISTS coupons (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, code VARCHAR(60) NOT NULL, scope VARCHAR(20) NOT NULL DEFAULT 'all', product_id BIGINT UNSIGNED NULL, category_id INT UNSIGNED NULL,
  type ENUM('fixed','percent') NOT NULL DEFAULT 'fixed', amount INT UNSIGNED NOT NULL, minimum_order INT UNSIGNED NOT NULL DEFAULT 0, maximum_discount INT UNSIGNED NULL,
  usage_limit INT UNSIGNED NULL, usage_count INT UNSIGNED NOT NULL DEFAULT 0, starts_at TIMESTAMP NULL, expires_at TIMESTAMP NULL, status TINYINT(1) NOT NULL DEFAULT 1,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, UNIQUE KEY coupons_code_unique (code), KEY coupons_active_window_index (status,starts_at,expires_at), KEY coupons_scope_index (scope,product_id,category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS wishlists (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, customer_id INT UNSIGNED NOT NULL, product_id BIGINT UNSIGNED NOT NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
  UNIQUE KEY wishlists_customer_product_unique (customer_id,product_id), KEY wishlists_product_index (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS abandoned_carts (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, token CHAR(36) NOT NULL, customer_id INT UNSIGNED NULL, phone VARCHAR(25) NULL, cart_data JSON NOT NULL, subtotal INT UNSIGNED NOT NULL DEFAULT 0,
  status ENUM('active','recovered','ignored') NOT NULL DEFAULT 'active', reminder_count TINYINT UNSIGNED NOT NULL DEFAULT 0, last_reminder_at TIMESTAMP NULL, recovered_at TIMESTAMP NULL, last_activity_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, UNIQUE KEY abandoned_carts_token_unique (token), KEY abandoned_carts_status_activity_index(status,last_activity_at), KEY abandoned_carts_customer_index(customer_id), KEY abandoned_carts_phone_index(phone)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS product_recommendations (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, product_id BIGINT UNSIGNED NOT NULL, recommended_product_id BIGINT UNSIGNED NOT NULL, sort_order INT UNSIGNED NOT NULL DEFAULT 0,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, UNIQUE KEY product_recommendations_unique(product_id,recommended_product_id), KEY product_recommendations_sort(product_id,sort_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS return_requests (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, order_id INT UNSIGNED NOT NULL, customer_id INT UNSIGNED NOT NULL, reason TEXT NOT NULL,
  status ENUM('pending','approved','rejected') NOT NULL DEFAULT 'pending', admin_note TEXT NULL, processed_at TIMESTAMP NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
  KEY return_requests_status_created(status,created_at), KEY return_requests_customer_order(customer_id,order_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS customer_tags (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, name VARCHAR(60) NOT NULL, color VARCHAR(20) NOT NULL DEFAULT '#087f5b', created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
  UNIQUE KEY customer_tags_name_unique(name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS customer_customer_tag (customer_id INT UNSIGNED NOT NULL, customer_tag_id BIGINT UNSIGNED NOT NULL, PRIMARY KEY(customer_id,customer_tag_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS product_events (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, product_id BIGINT UNSIGNED NOT NULL, event_type VARCHAR(30) NOT NULL, session_id VARCHAR(100) NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
  KEY product_events_product_type_date_index(product_id,event_type,created_at), KEY product_events_type_date_index(event_type,created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS shipping_promotions (id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, minimum_order INT UNSIGNED NOT NULL, message VARCHAR(255) NULL, status TINYINT(1) NOT NULL DEFAULT 1, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS courier_shipments (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, order_id INT UNSIGNED NOT NULL, courier_name VARCHAR(80) NOT NULL, tracking_number VARCHAR(120) NOT NULL,
  shipment_status VARCHAR(60) NOT NULL DEFAULT 'booked', dispatched_at TIMESTAMP NULL, delivered_at TIMESTAMP NULL, note TEXT NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL,
  UNIQUE KEY courier_shipments_order_unique(order_id), KEY courier_shipments_tracking(courier_name,tracking_number), KEY courier_shipments_status(shipment_status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Mark schema migrations as applied, so artisan migrate will not recreate these tables.
INSERT IGNORE INTO migrations (migration,batch) VALUES
('2025_04_05_000001_create_campaign_product_table',999),
('2025_12_31_000001_add_legacy_order_compatibility_columns',999),
('2026_08_06_000001_add_landing_page_fields_to_campaigns_table',999),
('2026_08_06_000002_add_storefront_and_reporting_indexes',999),
('2026_08_06_000003_create_coupons_table',999),
('2026_08_06_000004_create_wishlists_table',999),
('2026_08_06_000005_create_abandoned_carts_table',999),
('2026_08_06_000006_add_reminder_tracking_to_abandoned_carts_table',999),
('2026_08_06_000007_create_product_recommendations_table',999),
('2026_08_06_000008_create_return_requests_table',999),
('2026_08_06_000009_create_customer_tags_tables',999),
('2026_08_06_000010_create_product_events_table',999),
('2026_08_06_000011_create_shipping_promotions_table',999),
('2026_08_06_000012_add_scope_to_coupons_table',999),
('2026_08_06_000013_add_conversion_fields_to_campaigns_table',999),
('2026_08_06_000014_create_courier_shipments_table',999),
('2026_08_06_000015_add_pos_sales_fields',999);
