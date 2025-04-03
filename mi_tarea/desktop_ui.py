from tkinter import Tk, Button, Label, PhotoImage, messagebox, Frame
import subprocess
import threading
import webbrowser
import os
import http.server
import socketserver
from datetime import datetime


# settings
PORT = 8000
WEB_DIR = "pagina_web"
HOME_PAGE = "home.html"
SHELL_SCRIPT = "sportsos.sh"
TERMINAL_COMMAND = ["wsl", "bash", SHELL_SCRIPT]
OLYMPICS = "olympics.png"


def launch_shell():
    if not os.path.exists(SHELL_SCRIPT):
        messagebox.showerror("Error", f"file '{SHELL_SCRIPT}' not found")
        return
    try:
        subprocess.Popen(TERMINAL_COMMAND)
    except Exception as e:
        messagebox.showerror("Error", f"Failed to launch:\n{e}")
        
        
def launch_sofascore():
        webbrowser.open("https://www.sofascore.com")



def apply_hover_effect(boton, color_base, color_hover):
    def on_enter(e):
        e.widget.config(bg=color_hover, cursor="hand2")
    def on_leave(e):
        e.widget.config(bg=color_base, cursor="")
    boton.bind("<Enter>", on_enter)
    boton.bind("<Leave>", on_leave)



# launch web as a local server
def launch_web():
    if not os.path.exists(os.path.join(WEB_DIR, HOME_PAGE)):
        messagebox.showerror("Error", f"Web not found'{WEB_DIR}/{HOME_PAGE}'")
        return

    def start_server():
        os.chdir(WEB_DIR)
        Handler = http.server.SimpleHTTPRequestHandler
        with socketserver.TCPServer(("", PORT), Handler) as httpd:
            httpd.serve_forever()

    threading.Thread(target=start_server, daemon=True).start()

    try:
        webbrowser.open(f"http://localhost:{PORT}/{HOME_PAGE}")
    except Exception as e:
        messagebox.showerror("Error", f"Could not open the browser:\n{e}")


def update_time():
    current_time = datetime.now().strftime("%H:%M:%S")
    time_label.config(text=f"🕒 {current_time}")
    root.after(1000, update_time)


# UI
root = Tk()
root.title("SPORTos Desktop UI")
root.geometry("800x600")
root.configure(bg="#2e7d32")



# load and show image
if os.path.exists(OLYMPICS):
    logo_img = PhotoImage(file=OLYMPICS)
    logo_label = Label(root, image=logo_img, bg="#2e7d32")
    logo_label.image = logo_img  # mantener referencia
    logo_label.pack(pady=(10, 5))


time_label = Label(root, bg="#2e7d32", fg="white", font=("Segoe UI", 10))
time_label.pack(side="top")
update_time()


title_label = Label(
    root,
    text="🏆 WELCOME to SPORTos! 🏆",
    font=("Segoe UI Black", 24),
    bg="#2e7d32",
    fg="white",
    pady=20
)
title_label.pack()  #take place in the window


button_frame = Frame(root, bg="#2e7d32")
button_frame.pack(pady=10)

shell_button = Button(
    button_frame,
    text="⚽ Open SPORTos' Shell",
    font=("Segoe UI", 16, "bold"),
    relief="flat",
    bg="#1b5e20",
    fg="white",
    padx=18,
    pady=10,
    command=launch_shell
)
shell_button.pack(pady=8)
apply_hover_effect(shell_button,"#1b5e20", "#388e3c")


web_button = Button(
    button_frame,
    text="🌐 Open SPORTos' Web",
    font=("Segoe UI", 16, "bold"),
    relief="flat",
    bg="#1565c0",
    fg="white",
    padx=22,
    pady=10,
    command=launch_web
)
web_button.pack(pady=8)
apply_hover_effect(web_button,"#1565c0", "#1e88e5")


sofascore_button = Button(
    button_frame,
    text="📊 Live Match Results",
    font=("Segoe UI", 16, "bold"),
    relief="flat",
    bg="#c62828",
    fg="white",
    padx=33,
    pady=10,
    command=launch_sofascore
)
sofascore_button.pack(pady=8)
apply_hover_effect(sofascore_button, "#c62828", "#e53935")

exit_button = Button(button_frame, text="❌ Exit", bg="#424242", fg="white", command=root.destroy)
exit_button.pack(pady=8)


#footer's settings
footer = Label(         
    root,
    text="© 2025 SPORTos - All rights reserved",
    font=("Segoe UI", 10),
    bg="#1b5e20",
    fg="white",
    pady=10
)
footer.pack(side="bottom", fill="x")

root.mainloop()