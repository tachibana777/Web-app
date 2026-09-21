# Web-app
> **Course Project Overview**

---

## Assignment Requirements

### 1. Cloud Platform 
* ใช้งาน Cloud Platform เพื่อ Deploy Web App และ Database ([Railway](https://railway.com/))

### 2. Database Setup
* ใช้ Database **Northwind** จากไฟล์ `dbNorthwind.sql` 

### 3. Architecture
* ออกแบบ Web App โดยใช้หลักการ **CRUD ผ่าน API** 

### 4. Web Application Features
ระบบต้องมีฟังก์ชันการทำงานดังนี้:
* **ค้นหา** (Search)
* **เพิ่มข้อมูลสินค้า** (Create)
* **ดู / แสดงรายการของสินค้า** (Read)
* **แก้ไขข้อมูลสินค้า** (Update)
* **ลบข้อมูลสินค้า** (Delete)

### 5. Validation
* ตรวจสอบความถูกต้องของข้อมูลที่กรอกก่อนบันทึกเข้าระบบ

### 6. Alert & Feedback
* แสดง Alert / Popup แจ้งเตือนบนหน้าจอหลังจากทำรายการเสร็จสิ้น หรือมีการเปลี่ยนแปลง/อัปเดตข้อมูล:
  * แจ้งเตือนเมื่อ **เพิ่มข้อมูลสินค้า** สำเร็จ
  * แจ้งเตือนเมื่อ **แก้ไขข้อมูลสินค้า** สำเร็จ
  * แจ้งเตือนเมื่อ **ลบข้อมูลสินค้า** สำเร็จ

---

## Tech Stack

* **Backend / Frontend:** PHP
* **Database:** MySQL

---

## สิ่งที่ต้องส่ง (Deliverables)

1. **Live URL** หลังจาก Deploy ผ่าน Railway
2. **Document Link** (Google Docs) อธิบายขั้นตอนการทำงานและขั้นตอนการ Deploy โดยละเอียด
3. **Source Code** ทั้งหมด

---

## Project Structure

```
Web App/
│
├── index.html                         # หน้าเว็บหลัก (ตาราง + ฟอร์ม + Modal)
│
├── css/
│   └── style.css                      # Custom CSS เสริม Bootstrap 5
│
├── js/
│   ├── app.js                         # Logic หลัก (โหลดตาราง, ค้นหา, ลบ, แก้ไข)
│   ├── form.js                        # ฟอร์ม + Validation + Submit + Alert
│   └── loaddata.js                    # โหลด Dropdown (Categories, Suppliers)
│
├── inc/
│   └── connDB.php                     # เชื่อมต่อ MySQL ด้วย PDO (รองรับ ENV)
│
└── api/
    ├── .htaccess                      # URL Rewrite → index.php
    ├── index.php                      # Entry Point + ลงทะเบียน Routes
    │
    ├── core/
    │   ├── Router.php                 # จัดการ Routing (GET/POST/PUT/DELETE)
    │   └── Response.php               # จัดรูปแบบ JSON Response
    │
    └── controllers/
        ├── ProductController.php      # CRUD สินค้า (ตัวหลัก)
        ├── CategoryController.php     # ดึงข้อมูลหมวดหมู่ (Read-only)
        └── SupplierController.php     # ดึงข้อมูลผู้จำหน่าย (Read-only)
```

---

## API Endpoints

| Method | Path | หน้าที่ |
|:---|:---|:---|
| `GET` | `/api/products` | ดึงรายการสินค้าทั้งหมด (+ `?search=keyword`) |
| `GET` | `/api/products/{id}` | ดึงข้อมูลสินค้ารายตัว |
| `POST` | `/api/products` | เพิ่มสินค้าใหม่ |
| `PUT` | `/api/products/{id}` | แก้ไขข้อมูลสินค้า |
| `DELETE` | `/api/products/{id}` | ลบสินค้า |
| `GET` | `/api/categories` | ดึงหมวดหมู่สินค้าทั้งหมด (สำหรับ Dropdown) |
| `GET` | `/api/categories/{id}` | ดึงหมวดหมู่สินค้ารายตัว |
| `GET` | `/api/suppliers` | ดึงผู้จัดจำหน่ายทั้งหมด (สำหรับ Dropdown) |
| `GET` | `/api/suppliers/{id}` | ดึงผู้จัดจำหน่ายรายตัว |
