# E-commerce Database Design Documentation

## Project Name
**E-commerce Database Design**  
Created by: **Joseph Onyango**  
Cohort: Power Learn Project – February 2025, Cohort VII

---

## 1. Introduction

This document provides a detailed overview of the e-commerce database I designed as part of my Power Learn Project. The aim was to build a clean, scalable relational database that supports core functionalities of an online store — including product management, variations, categories, images, and attributes.

---

## 2. Objectives

- Create a normalized, efficient database structure for e-commerce operations.
- Define all necessary entities and their relationships.
- Implement support for product variations like size and color.
- Allow dynamic product attributes like material, weight, etc.
- Provide a clear and readable Entity-Relationship Diagram (ERD).

---

## 3. Database Tables Overview

| Table Name           | Description                                                                 |
|----------------------|-----------------------------------------------------------------------------|
| `brand`              | Stores brand information for products.                                     |
| `product_category`   | Classifies products into types like clothing, electronics, etc.            |
| `product`            | Contains basic product data such as name, base price, and brand ID.        |
| `product_image`      | Holds URLs or paths to product images.                                     |
| `color`              | Lists available color options for products.                                |
| `size_category`      | Groups size systems (e.g., shoe sizes, clothing sizes).                    |
| `size_option`        | Stores individual size values (e.g., S, M, 42).                            |
| `product_variation`  | Links a product to its size and color options.                             |
| `product_item`       | Represents unique purchasable SKUs with price and stock info.              |
| `attribute_category` | Groups attributes (e.g., technical, physical).                             |
| `attribute_type`     | Defines types of attributes like weight or material.                       |
| `product_attribute`  | Stores attribute values for specific products.                             |

---

## 4. Relationships

- Each product belongs to one brand and one category.
- A product can have multiple images and attributes.
- Variations link products to sizes and colors.
- Each variation can become a purchasable item with price and stock info.
- Attributes are grouped for organization and flexibility.

---

## 5. Design Principles

- **Normalized** to 3rd Normal Form (3NF)
- Uses **Primary Keys** and **Foreign Keys** to maintain data integrity
- Ensures scalability by using lookup/reference tables (e.g., for color, size)
- Supports dynamic data through attribute tables

---

## 6. ERD

A visual diagram (`erd-image.png`) is included to help explain how all tables connect. This provides a clear picture of the database structure and relationships.

---

## 7. Tools Used

- **MySQL** – For database design and testing
- **Draw.io / dbdiagram.io** – For ERD creation
- **GitHub** – For version control and collaboration

---

## 8. How to Use

1. Clone or download the repository.
2. Open and run `ecommerce.sql` in your MySQL tool.
3. Refer to `erd-image.png` and `README.md` for structure and explanation.

---

## 9. Conclusion

This project demonstrates how to design an organized and dynamic database structure for a real-world e-commerce application. It was a great learning experience in SQL, normalization, and database architecture.

---

**Author:**  
**Joseph Onyango**  
April 2025  
Power Learn Project – Software Development Track
