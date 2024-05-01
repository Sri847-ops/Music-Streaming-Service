import tkinter as tk
from tkinter import messagebox
import psycopg2

class UploadWindow:
    def __init__(self, root):
        self.root = root
        self.root.title("Upload Song")
        
        # Set window size
        self.root.geometry("300x200")
        
        # Create labels and entry widgets for song details
        tk.Label(root, text="Song Name:").grid(row=0, column=0, padx=10, pady=5, sticky="w")
        tk.Label(root, text="Genre:").grid(row=1, column=0, padx=10, pady=5, sticky="w")
        tk.Label(root, text="Language:").grid(row=2, column=0, padx=10, pady=5, sticky="w")
        
        self.song_name_entry = tk.Entry(root)
        self.genre_entry = tk.Entry(root)
        self.language_entry = tk.Entry(root)
        
        self.song_name_entry.grid(row=0, column=1, padx=10, pady=5)
        self.genre_entry.grid(row=1, column=1, padx=10, pady=5)
        self.language_entry.grid(row=2, column=1, padx=10, pady=5)
        
        # Create upload button
        tk.Button(root, text="Upload", command=self.upload_song).grid(row=3, columnspan=2, pady=10)
        
    def upload_song(self):
        # Retrieve song details from entry widgets
        song_name = self.song_name_entry.get()
        genre = self.genre_entry.get()
        language = self.language_entry.get()
        
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
            x = 11
            # Execute query to insert song into songs entity
            cursor.execute("INSERT INTO songs VALUES (%s, %s, %s, %s, %s)", (x,103 ,genre, song_name, language))
            connection.commit()
            
            messagebox.showinfo("Upload Success", "Song uploaded successfully!")
            
        except (Exception, psycopg2.Error) as error:
            messagebox.showerror("Upload Error", f"Error while uploading song: {error}")
            
        finally:
            # Close database connection
            if connection:
                cursor.close()
                connection.close()

if __name__ == "__main__":
    root = tk.Tk()
    app = UploadWindow(root)
    root.mainloop()
