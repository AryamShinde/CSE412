from flask import Flask, render_template, request, redirect, url_for, flash, session
import psycopg2
from werkzeug.security import generate_password_hash, check_password_hash
from functools import wraps

app = Flask(__name__)
app.secret_key = 'supersecretkey'

# Database connection
def get_db_connection():
    conn = psycopg2.connect(
        host="localhost",
        database="group_project",
        user="postgres",
        password="yourpassword"
    )
    return conn

# Login required decorator
def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if not session.get('logged_in'):
            flash('Please log in to access this page.', 'warning')
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated_function

# Routes

@app.route('/')
def default():
    return redirect(url_for('login'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM Customer WHERE Username = %s', (username,))
        user = cur.fetchone()
        cur.close()
        conn.close()

        if user and check_password_hash(user[4], password):  # Password assumed to be in column 4
            session['logged_in'] = True
            session['username'] = username
            flash('Login successful!', 'success')
            return redirect(url_for('dashboard'))
        else:
            flash('Invalid username or password', 'danger')

    return render_template('login.html')

@app.route('/logout')
def logout():
    session.clear()
    flash('You have been logged out.', 'info')
    return redirect(url_for('login'))

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        username = request.form['username']
        password = request.form['password']

        hashed_password = generate_password_hash(password, method='sha256')

        conn = get_db_connection()
        cur = conn.cursor()
        try:
            cur.execute(
                'INSERT INTO Customer (Name, Email, Username, Password) VALUES (%s, %s, %s, %s)',
                (name, email, username, hashed_password)
            )
            conn.commit()
            flash('Registration successful! Please log in.', 'success')
            return redirect(url_for('login'))
        except psycopg2.Error as e:
            flash('Error: ' + str(e), 'danger')
        finally:
            cur.close()
            conn.close()

    return render_template('register.html')

@app.route('/dashboard')
@login_required
def dashboard():
    return render_template('dashboard.html')

@app.route('/menu', methods=['GET', 'POST'])
@login_required
def menu_list():
    conn = get_db_connection()
    cur = conn.cursor()

    if request.method == 'POST':
        name = request.form['name']
        description = request.form['description']
        price = request.form['price']
        category = request.form['category']

        try:
            cur.execute(
                '''
                INSERT INTO MenuItem (Name, Description, Price, Category)
                VALUES (%s, %s, %s, %s)
                ''',
                (name, description, price, category)
            )
            conn.commit()
            flash('Menu item added successfully!', 'success')
        except psycopg2.Error as e:
            flash(f'Error: {str(e)}', 'danger')

    cur.execute('SELECT * FROM MenuItem')
    menu_items = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('menu.html', menu_items=menu_items)

@app.route('/reservations', methods=['GET', 'POST'])
@login_required
def reservation_list():
    conn = get_db_connection()
    cur = conn.cursor()

    if request.method == 'POST':
        customer_id = request.form['customer_id']
        reservation_time = request.form['reservation_time']
        party_size = request.form['party_size']
        status = request.form['status']
        special_requests = request.form['special_requests']

        try:
            cur.execute(
                '''
                INSERT INTO Reservation (CustomerID, ReservationTime, PartySize, Status, SpecialRequests)
                VALUES (%s, %s, %s, %s, %s)
                ''',
                (customer_id, reservation_time, party_size, status, special_requests)
            )
            conn.commit()
            flash('Reservation added successfully!', 'success')
        except psycopg2.Error as e:
            flash(f'Error: {str(e)}', 'danger')

    cur.execute('SELECT * FROM Reservation')
    reservations = cur.fetchall()

    # Fetch all customers for the dropdown
    cur.execute('SELECT CustomerID, Name FROM Customer')
    customers = cur.fetchall()

    cur.close()
    conn.close()
    return render_template('reservations.html', reservations=reservations, customers=customers)

@app.route('/reviews', methods=['GET', 'POST'])
@login_required
def review_list():
    conn = get_db_connection()
    cur = conn.cursor()

    if request.method == 'POST':
        customer_id = request.form['customer_id']
        menu_item_id = request.form['menu_item_id']
        rating = request.form['rating']
        comment = request.form['comment']

        try:
            cur.execute(
                '''
                INSERT INTO Review (CustomerID, MenuItemID, Rating, Comment)
                VALUES (%s, %s, %s, %s)
                ''',
                (customer_id, menu_item_id, rating, comment)
            )
            conn.commit()
            flash('Review added successfully!', 'success')
        except psycopg2.Error as e:
            flash(f'Error: {str(e)}', 'danger')

    # Fetch reviews with additional details
    cur.execute(
        '''
        SELECT r.ReviewID, c.Name AS CustomerName, m.Name AS MenuItemName, r.Rating, r.Comment, r.ReviewDate
        FROM Review r
        JOIN Customer c ON r.CustomerID = c.CustomerID
        JOIN MenuItem m ON r.MenuItemID = m.ItemID
        '''
    )
    reviews = cur.fetchall()

    # Fetch all customers for the dropdown
    cur.execute('SELECT CustomerID, Name FROM Customer')
    customers = cur.fetchall()

    # Fetch all menu items for the dropdown
    cur.execute('SELECT ItemID, Name FROM MenuItem')
    menu_items = cur.fetchall()

    cur.close()
    conn.close()

    return render_template('review.html', reviews=reviews, customers=customers, menu_items=menu_items)


@app.route('/tables', methods=['GET', 'POST'])
@login_required
def table_list():
    conn = get_db_connection()
    cur = conn.cursor()

    if request.method == 'POST':
        capacity = request.form['capacity']
        location = request.form['location']

        try:
            cur.execute(
                '''
                INSERT INTO RestaurantTable (Capacity, Location)
                VALUES (%s, %s)
                ''',
                (capacity, location)
            )
            conn.commit()
            flash('Table added successfully!', 'success')
        except psycopg2.Error as e:
            flash(f'Error: {str(e)}', 'danger')

    cur.execute('SELECT * FROM RestaurantTable')
    tables = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('tables.html', tables=tables)

if __name__ == '__main__':
    app.run(debug=True)
