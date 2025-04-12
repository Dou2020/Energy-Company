from flask import Flask, render_template, request, redirect
import pyodbc

app = Flask(__name__)

conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=localhost;"
    "DATABASE=company_energy;"
    "UID=dou_company_energy;"
    "PWD=1234"
)

# menú primncipal con lista de empleados
@app.route("/")
def index():
    return render_template("index.html")

@app.route("/cliente")
def cliente():
    return render_template("cliente.html")

if __name__ == "__main__":
    app.run(debug=True)
