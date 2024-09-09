import subprocess
import psutil

def run_powershell_script(process_id, new_name):
    script_path = "F:\\git\\spoofer\\change_process_name.ps1"
    command = f'powershell -ExecutionPolicy Bypass -File "{script_path}" -ProcessId {process_id} -NewName "{new_name}"'
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error: {result.stderr}")
    else:
        print(f"Success: {result.stdout}")

# Найти процесс Cheat Engine и изменить его имя
for proc in psutil.process_iter(['pid', 'name']):
    if proc.info['name'] == 'cheatengine-x86_64-SSE4-AVX2.exe':
        run_powershell_script(proc.info['pid'], 'notepad.exe')
        break
