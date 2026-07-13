import tkinter as tk
from tkinter import messagebox


# ---------------- Encryption ----------------
def encrypt():
    try:
        text = entry.get()
        key = int(key_entry.get())

        result = ""

        for ch in text:
            if ch.isupper():
                result += chr((ord(ch) - 65 + key) % 26 + 65)
            elif ch.islower():
                result += chr((ord(ch) - 97 + key) % 26 + 97)
            else:
                result += ch

        output.config(text=result)

    except ValueError:
        messagebox.showerror("Error", "Please enter a valid key.")


# ---------------- Decryption ----------------
def decrypt():
    try:
        text = entry.get()
        key = int(key_entry.get())

        result = ""

        for ch in text:
            if ch.isupper():
                result += chr((ord(ch) - 65 - key) % 26 + 65)
            elif ch.islower():
                result += chr((ord(ch) - 97 - key) % 26 + 97)
            else:
                result += ch

        output.config(text=result)

    except ValueError:
        messagebox.showerror("Error", "Please enter a valid key.")


# ---------------- Clear ----------------
def clear():
    entry.delete(0, tk.END)
    key_entry.delete(0, tk.END)
    output.config(text="")


# ---------------- Button Hover ----------------
def enter_encrypt(e):
    encrypt_btn["bg"] = "#FF1493"


def leave_encrypt(e):
    encrypt_btn["bg"] = "#FF69B4"


def enter_decrypt(e):
    decrypt_btn["bg"] = "#DB7093"


def leave_decrypt(e):
    decrypt_btn["bg"] = "#C71585"


# ---------------- Window ----------------
root = tk.Tk()
root.title("Substitution Cipher")
root.geometry("650x520")
root.configure(bg="#FFF0F5")
root.resizable(False, False)

# ---------------- Title ----------------
title = tk.Label(
    root,
    text="🔐 SUBSTITUTION CIPHER",
    font=("Segoe UI", 24, "bold"),
    bg="#FF69B4",
    fg="white",
    pady=15
)
title.pack(fill="x")

subtitle = tk.Label(
    root,
    text="Classical Caesar Cipher Encryption & Decryption",
    font=("Segoe UI", 11),
    bg="#FFF0F5",
    fg="#C71585"
)
subtitle.pack(pady=10)

# ---------------- Card ----------------
card = tk.Frame(
    root,
    bg="white",
    bd=2,
    relief="groove"
)
card.pack(padx=30, pady=15, fill="both")

# Message
tk.Label(
    card,
    text="Message",
    font=("Segoe UI", 12, "bold"),
    bg="white",
    fg="#C71585"
).pack(pady=(20, 5))

entry = tk.Entry(
    card,
    font=("Segoe UI", 13),
    width=45,
    bd=2,
    relief="solid"
)
entry.pack()

# Key
tk.Label(
    card,
    text="Shift Key",
    font=("Segoe UI", 12, "bold"),
    bg="white",
    fg="#C71585"
).pack(pady=(20, 5))

key_entry = tk.Entry(
    card,
    font=("Segoe UI", 13),
    width=10,
    justify="center",
    bd=2,
    relief="solid"
)
key_entry.pack()

# ---------------- Buttons ----------------
button_frame = tk.Frame(card, bg="white")
button_frame.pack(pady=25)

encrypt_btn = tk.Button(
    button_frame,
    text="Encrypt",
    command=encrypt,
    bg="#FF69B4",
    fg="white",
    font=("Segoe UI", 12, "bold"),
    width=12,
    relief="flat",
    cursor="hand2"
)
encrypt_btn.grid(row=0, column=0, padx=10)

decrypt_btn = tk.Button(
    button_frame,
    text="Decrypt",
    command=decrypt,
    bg="#C71585",
    fg="white",
    font=("Segoe UI", 12, "bold"),
    width=12,
    relief="flat",
    cursor="hand2"
)
decrypt_btn.grid(row=0, column=1, padx=10)

clear_btn = tk.Button(
    button_frame,
    text="Clear",
    command=clear,
    bg="#808080",
    fg="white",
    font=("Segoe UI", 12, "bold"),
    width=12,
    relief="flat",
    cursor="hand2"
)
clear_btn.grid(row=0, column=2, padx=10)

encrypt_btn.bind("<Enter>", enter_encrypt)
encrypt_btn.bind("<Leave>", leave_encrypt)

decrypt_btn.bind("<Enter>", enter_decrypt)
decrypt_btn.bind("<Leave>", leave_decrypt)

# ---------------- Result ----------------
tk.Label(
    card,
    text="Result",
    font=("Segoe UI", 12, "bold"),
    bg="white",
    fg="#C71585"
).pack()

output = tk.Label(
    card,
    text="",
    font=("Consolas", 14, "bold"),
    bg="#FFF5F8",
    fg="#8B008B",
    width=45,
    height=3,
    relief="ridge",
    bd=2
)
output.pack(pady=15)

# ---------------- Footer ----------------
footer = tk.Label(
    root,
    text="Developed using Python Tkinter | Classical Cryptography",
    font=("Segoe UI", 10, "italic"),
    bg="#FFF0F5",
    fg="gray"
)
footer.pack(side="bottom", pady=10)

root.mainloop()