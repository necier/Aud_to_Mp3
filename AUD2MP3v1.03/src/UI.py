import tkinter as tk
import subprocess
from tkinter import filedialog
root =tk.Tk()
root.withdraw()
path=filedialog.askdirectory()
subprocess.call('test.bat '+path)
