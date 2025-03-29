
# 🖥️ SPORTos Desktop UI - Explicación del Código

Este documento explica **paso a paso** cada parte del código de la aplicación `desktop_ui_server_button.py` para que entiendas todo lo que hace tu sistema SPORTos.

---

## 🔸 Puerto (`PORT`)
```python
PORT = 8000
```
Es el número de puerto donde corre el **servidor web local**.  
Se accede desde el navegador con: `http://localhost:8000`

---

## 🔸 ¿Qué es un servidor local?
Es un servidor que corre en **tu propia máquina** para simular cómo se vería tu página web en internet.  
Permite que el navegador cargue bien CSS, imágenes, y scripts. Con servidor local la web se ve perfecta, como debe ser.

---

## 🔸 `root`
```python
root = Tk()
```
`root` es un **objeto** que representa la **ventana principal** de tu escritorio.

---

## 🔸 `root.configure(bg="#2e7d32")`
Este método cambia propiedades del objeto `root`.  
En este caso, se le cambia el **color de fondo** a verde (`bg = background`).

---

## 🔸 `title_label`
```python
title_label = Label(root, text="...", ...)
```
Es una **etiqueta de texto** que se muestra en la ventana.  
Parámetros:
- `text`: contenido que se muestra
- `font`: fuente usada (`("Helvetica", 24, "bold")`)
- `bg`: fondo
- `fg`: color del texto
- `pady`: espacio vertical alrededor del widget

---

## 🔸 `font`
```python
font=("Helvetica", 24, "bold")
```
Define el **tipo de letra**, tamaño y estilo (negrita).

---

## 🔸 `pady`
Padding en eje Y (vertical).  
Agrega espacio **arriba y abajo** del widget.

---

## 🔸 ¿Entre qué deja espacio `pady`?
Entre el widget actual y los que están **encima o debajo de él**.

---

## 🔸 `title_label.pack()`
Coloca el widget en la ventana.  
Sin `.pack()` no se muestra nada.  
`pack()` organiza el widget automáticamente.

---

## 🔸 `shell_button`
```python
shell_button = Button(...)
```
Crea un botón que lanza la shell.  
Parámetros:
- `text`: lo que dice el botón
- `font`, `bg`, `fg`, `padx`, `pady`: estilo
- `command=launch_shell`: función que se ejecuta al hacer clic

---

## 🔸 `padx`
Padding en eje X (horizontal).  
Agrega espacio a la **izquierda y derecha** del widget.

---

## 🔸 `command`
Es la **función que se ejecuta** cuando haces clic en el botón.

---

## 🔸 `web_button`
Botón que lanza la página web abriendo el servidor local.

---

## 🔸 `info_label`
Etiqueta que muestra texto decorativo al fondo.  
Se coloca con:
```python
info_label.pack(side="bottom", pady=30)
```

---

## 🔸 `root.mainloop()`
Inicia el **bucle principal** de la interfaz.  
Sin esto, la ventana **no se mantiene abierta**.

---

## 🧩 Funciones del sistema

### ✅ `launch_shell()`
```python
def launch_shell():
    ...
```

1. Verifica si el archivo `sportsos.sh` existe.
2. Si no existe, muestra error.
3. Si existe, lo ejecuta en WSL usando `subprocess.Popen(...)`.

---

### ✅ `launch_web()`
```python
def launch_web():
    ...
```

1. Verifica si el archivo `home.html` existe dentro de la carpeta web.
2. Define una función interna `start_server()` que:
   - Cambia de directorio (`os.chdir(...)`)
   - Inicia un servidor HTTP local con `http.server`.
3. Corre el servidor en un **hilo separado** (`threading.Thread`) para no congelar la interfaz.
4. Abre el navegador con `webbrowser.open(...)` apuntando a `http://localhost:8000/home.html`.

---

Este archivo fue generado automáticamente con base en tus preguntas para que tengas una documentación completa y clara de tu proyecto SPORTos.
