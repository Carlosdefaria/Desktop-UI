
from tkinter import Tk, Button, Label, PhotoImage, messagebox
import subprocess
import threading
import webbrowser
import os
import http.server
import socketserver


# Configuración
PORT = 8000
WEB_DIR = "pagina_web"
HOME_PAGE = "home.html"
SHELL_SCRIPT = "sportsos.sh"
TERMINAL_COMMAND = ["wsl", "bash", SHELL_SCRIPT]
OLYMPIC_LOGO = "olympics.png"


# Función para lanzar la shell
def launch_shell():
    if not os.path.exists(SHELL_SCRIPT):
        messagebox.showerror("Error", f"No se encontró el archivo '{SHELL_SCRIPT}'")
        return
    try:
        subprocess.Popen(TERMINAL_COMMAND)
    except Exception as e:
        messagebox.showerror("Error", f"No se pudo lanzar la shell:\n{e}")


# Función para lanzar la web como servidor local
def launch_web():
    if not os.path.exists(os.path.join(WEB_DIR, HOME_PAGE)):
        messagebox.showerror("Error", f"No se encontró '{WEB_DIR}/{HOME_PAGE}'")
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
        messagebox.showerror("Error", f"No se pudo abrir el navegador:\n{e}")


# UI
root = Tk()
root.title("SPORTos Desktop UI")
root.geometry("800x600")
root.configure(bg="#2e7d32")


# Cargar y mostrar imagen olímpica
if os.path.exists(OLYMPIC_LOGO):
    logo_img = PhotoImage(file=OLYMPIC_LOGO)
    logo_label = Label(root, image=logo_img, bg="#2e7d32")
    logo_label.image = logo_img  # mantener referencia
    logo_label.pack(pady=(10, 5))

title_label = Label(
    root,
    text="🏆 ¡Bienvenido de nuevo a SPORTos! 🏆",
    font=("Helvetica", 24, "bold"),
    bg="#2e7d32",
    fg="white",
    pady=20
)
title_label.pack()

shell_button = Button(
    root,
    text="⚽ Abrir Shell SPORTos",
    font=("Helvetica", 16, "bold"),
    bg="#1b5e20",
    fg="white",
    padx=20,
    pady=10,
    command=launch_shell
)
shell_button.pack(pady=20)

web_button = Button(
    root,
    text="🌐 Abrir Web de SPORTos",
    font=("Helvetica", 16, "bold"),
    bg="#1565c0",
    fg="white",
    padx=20,
    pady=10,
    command=launch_web
)
web_button.pack(pady=10)

info_label = Label(
    root,
    text="🏀🎯🎮 Tu cancha digital 🏀🎯🎮",
    font=("Helvetica", 14),
    bg="#2e7d32",
    fg="white"
)
info_label.pack(side="bottom", pady=30)

root.mainloop()