# CSE412
# Restaurant Management System

## Project Overview
The **Restaurant Management System** is a web-based application that enables efficient management of restaurant operations, including menu items, reservations, reviews, and tables. Built with **Flask** and **PostgreSQL**, the application provides an intuitive interface and robust functionality to streamline restaurant workflows.

This project fulfills the requirements for Phase 3 of the database application project, evaluated on functionality, design, and usability.

---

## Features
- **User Authentication**:
  - Secure login and registration with password hashing.
- **Dashboard**:
  - Centralized navigation for managing menus, reservations, reviews, and tables.
- **Menu Management**:
  - View, add, and manage menu items.
- **Reservations**:
  - Create and track customer reservations.
- **Reviews**:
  - Add and manage customer reviews.
- **Table Management**:
  - View, add, and manage restaurant tables.

---

## Technologies Used
- **Backend**: Flask (Python)
- **Database**: PostgreSQL
- **Frontend**: HTML, CSS, Bootstrap
- **Authentication**: Werkzeug for password hashing

---

## Installation Guide

### Prerequisites
- Python 3.8+
- PostgreSQL 12+
- Git

### Setup Instructions
1. **Clone the Repository**:
   ```bash
   git clone 
   cd restaurant-management https://github.com/AryamShinde/CSE412

2. **Install Dependencies**:
   ```bash
   pip install -r requirements.txt

3. **Setup Databases**:
   ```bash
   psql -U postgres -d group_project -f group_project.sql

4. **Run the application**:
   ```bash
   python app.py

5. **Access the Application**
a. Open your web browser and navigate to : <http://127.0.0.1:5000>
b. Register a new account or log in using username "a" and password as "a".

