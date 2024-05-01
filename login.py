import tkinter as tk
from tkinter import messagebox
import psycopg2
from songs import SongsWindow
from upload import UploadWindow

class LoginApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Login")
        
        # Set window size
        self.root.geometry("300x150")
        
        # Create radio buttons for user type selection
        self.user_type_var = tk.StringVar(value="User")
        user_radio = tk.Radiobutton(root, text="User", variable=self.user_type_var, value="User")
        artist_radio = tk.Radiobutton(root, text="Artist", variable=self.user_type_var, value="Artist")
        user_radio.grid(row=0, column=0)
        artist_radio.grid(row=0, column=1)
        
        # Create labels and entry widgets for email and password
        tk.Label(root, text="Email").grid(row=1, column=0)
        tk.Label(root, text="Password").grid(row=2, column=0)
        self.email_entry = tk.Entry(root)
        self.password_entry = tk.Entry(root, show="*")
        self.email_entry.grid(row=1, column=1)
        self.password_entry.grid(row=2, column=1)
        
        # Create login button
        tk.Button(root, text="Login", command=self.login).grid(row=3, columnspan=2)
    
    def login(self):
    # Retrieve user input
        email = self.email_entry.get()
        password = self.password_entry.get()
        user_type = self.user_type_var.get()  # Get selected user type
        
        # Connect to PostgreSQL database
        try:
            connection = psycopg2.connect(
                user="postgres",
                password="Venky1971#",
                host="127.0.0.1",
                port="5432",
                database="Music Streaming Service"
            )
            cursor = connection.cursor()
            
            # Execute query to check if user exists
            if user_type == "User":
                cursor.execute("SELECT * FROM users WHERE email = %s AND pwd = %s", (email, password))
            elif user_type == "Artist":
                cursor.execute("SELECT * FROM artist WHERE email_id = %s AND pwd = %s", (email, password))
            user = cursor.fetchone()
            
            if user:
                # If user exists, check user type and open corresponding window
                self.root.destroy()
                if user_type == "User":
                    root = tk.Tk()
                    app = SongsWindow(root)
                    root.mainloop()
                elif user_type == "Artist":
                    root = tk.Tk()
                    app = UploadWindow(root)
                    root.mainloop()
            else:
                # If user doesn't exist, show error message
                messagebox.showerror("Login Error", "Invalid email or password.")
                
        except (Exception, psycopg2.Error) as error:
            messagebox.showerror("Database Error", f"Error while connecting to PostgreSQL: {error}")
            
        finally:
            # Close database connection
            if connection:
                cursor.close()
                connection.close()


if __name__ == "__main__":
    root = tk.Tk()
    app = LoginApp(root)
    root.mainloop()
