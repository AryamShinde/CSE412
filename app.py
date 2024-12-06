from flask import Flask, render_template, request, redirect, url_for, flash
import psycopg2

app = Flask(__name__)
app.secret_key = 'supersecretkey'

# Database connection
def get_db_connection():
    conn = psycopg2.connect(
        host="localhost",
        database="restaurant_db",
        user="postgres",
        password="yourpassword"
    )
    return conn

# Home route
@app.route('/')
def home():
    return render_template('base.html')

# Menu routes
@app.route('/menu')
def menu():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM MenuItems;')
    menu_items = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('menu.html', menu_items=menu_items)

@app.route('/menu/add', methods=['GET', 'POST'])
def add_menu_item():
    if request.method == 'POST':
        name = request.form['name']
        description = request.form['description']
        ingredients = request.form['ingredients']
        price = request.form['price']
        category = request.form['category']
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute(
            'INSERT INTO MenuItems (Name, Description, Ingredients, Price, Category) VALUES (%s, %s, %s, %s, %s)',
            (name, description, ingredients, price, category)
        )
        conn.commit()
        cur.close()
        conn.close()
        flash('Menu item added successfully!', 'success')
        return redirect(url_for('menu'))
    return render_template('add_menu_item.html')

# Reservations routes
@app.route('/reservations')
def reservations():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM Reservations;')
    reservations = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('reservations.html', reservations=reservations)

@app.route('/reservations/add', methods=['GET', 'POST'])
def add_reservation():
    if request.method == 'POST':
        customer_id = request.form['customer_id']
        time = request.form['time']
        party_size = request.form['party_size']
        special_requests = request.form['special_requests']
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute(
            'INSERT INTO Reservations (CustomerID, Time, PartySize, SpecialRequests) VALUES (%s, %s, %s, %s)',
            (customer_id, time, party_size, special_requests)
        )
        conn.commit()
        cur.close()
        conn.close()
        flash('Reservation added successfully!', 'success')
        return redirect(url_for('reservations'))
    return render_template('add_reservation.html')

if __name__ == '__main__':
    app.run(debug=True)
