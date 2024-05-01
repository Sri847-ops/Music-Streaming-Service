import tkinter as tk
import psycopg2

class SongsWindow:
    def __init__(self, root):
        self.root = root
        self.root.title("Songs Window")
        
        # Set window size
        self.root.geometry("500x500")
        
        # Create a frame to contain the song list
        self.frame = tk.Frame(self.root)
        self.frame.pack(pady=10)
        
        # Connect to PostgreSQL database
        try:
            self.connection = psycopg2.connect(
                user="postgres",
                password="Venky1971#",
                host="127.0.0.1",
                port="5432",
                database="Music Streaming Service"
            )
            self.cursor = self.connection.cursor()
            
            # Execute query to retrieve songs information
            self.cursor.execute("SELECT song_id, song_name, f_name, l_name, song_language FROM songs NATURAL JOIN artist")
            songs = self.cursor.fetchall()
            
            # Display songs information in the frame
            for song in songs:
                song_id = song[0]
                song_name = song[1]
                f_name = song[2]
                l_name = song[3]
                language = song[4]
                
                # Create label for song name (bold and big font)
                song_label = tk.Label(self.frame, text=song_name, font=("Arial", 14, "bold"))
                song_label.grid(sticky="w")
                
                # Create labels for artist name and language (small font)
                artist_label = tk.Label(self.frame, text=f"Artist: {f_name} {l_name}", font=("Arial", 10))
                artist_label.grid(sticky="w")
                language_label = tk.Label(self.frame, text=f"Language: {language}", font=("Arial", 10))
                language_label.grid(sticky="w")
                
                # Create download button for each song
                download_button = tk.Button(self.frame, text="Download", command=lambda song_id=song_id: self.download_song(song_id))
                download_button.grid(sticky="w")
                
                # Add some padding between each song
                tk.Label(self.frame, text="").grid()
                
        except (Exception, psycopg2.Error) as error:
            tk.messagebox.showerror("Database Error", f"Error while connecting to PostgreSQL: {error}")
            
    def download_song(self, song_id):
        try:
            # Execute query to update downloads entity
            self.cursor.execute("INSERT INTO downloads VALUES (%s,%s,%s)", (510,song_id,1))
            self.connection.commit()
            tk.messagebox.showinfo("Download", "Song downloaded successfully!")
            
        except (Exception, psycopg2.Error) as error:
            tk.messagebox.showerror("Download Error", f"Error while downloading song: {error}")
            
    def __del__(self):
        # Close database connection
        if self.connection:
            self.cursor.close()
            self.connection.close()

if __name__ == "__main__":
    root = tk.Tk()
    app = SongsWindow(root)
    root.mainloop()
