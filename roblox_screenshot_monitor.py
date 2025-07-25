import time
import os
import psutil
import pyautogui
from datetime import datetime
import win32gui
import win32con

class RobloxScreenshotMonitor:
    def __init__(self, save_directory="D:\\Digital_Printers_Images"):
        self.save_directory = save_directory
        self.running = False
        
        # Create save directory if it doesn't exist
        if not os.path.exists(self.save_directory):
            os.makedirs(self.save_directory)
            print(f"Created directory: {self.save_directory}")
    
    def is_natro_macro_running(self):
        """Check if Natro Macro process is running"""
        for proc in psutil.process_iter(['pid', 'name', 'exe']):
            try:
                # Check for AutoHotkey processes that might be Natro Macro
                if proc.info['name'] and 'autohotkey' in proc.info['name'].lower():
                    if proc.info['exe'] and 'natromacro' in proc.info['exe'].lower():
                        return True
                # Also check for any process with "natro" in the name
                if proc.info['name'] and 'natro' in proc.info['name'].lower():
                    return True
            except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
                pass
        return False
    
    def find_roblox_window(self):
        """Find Roblox window handle and position"""
        def enum_windows_proc(hwnd, windows):
            if win32gui.IsWindowVisible(hwnd):
                window_text = win32gui.GetWindowText(hwnd)
                if 'roblox' in window_text.lower() or 'bee swarm simulator' in window_text.lower():
                    windows.append((hwnd, window_text))
            return True
        
        windows = []
        win32gui.EnumWindows(enum_windows_proc, windows)
        
        if windows:
            return windows[0][0]  # Return the first Roblox window found
        return None
    
    def capture_roblox_screenshot(self):
        """Capture screenshot of Roblox window"""
        try:
            roblox_hwnd = self.find_roblox_window()
            
            if not roblox_hwnd:
                print("Roblox window not found, taking full screen screenshot")
                screenshot = pyautogui.screenshot()
            else:
                # Get window position and size
                rect = win32gui.GetWindowRect(roblox_hwnd)
                x, y, x2, y2 = rect
                width = x2 - x
                height = y2 - y
                
                # Bring window to foreground
                win32gui.SetForegroundWindow(roblox_hwnd)
                time.sleep(0.5)  # Brief pause to ensure window is active
                
                # Take screenshot of the specific window area
                screenshot = pyautogui.screenshot(region=(x, y, width, height))
            
            # Generate filename with timestamp
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            filename = f"roblox_screenshot_{timestamp}.png"
            filepath = os.path.join(self.save_directory, filename)
            
            # Save screenshot
            screenshot.save(filepath)
            print(f"Screenshot saved: {filename}")
            
        except Exception as e:
            print(f"Error capturing screenshot: {e}")
    
    def start_monitoring(self):
        """Start the monitoring loop"""
        print("Starting Roblox Screenshot Monitor...")
        print(f"Screenshots will be saved to: {self.save_directory}")
        print("Waiting for Natro Macro to start...")
        
        self.running = True
        
        while self.running:
            try:
                if self.is_natro_macro_running():
                    print("Natro Macro detected - taking screenshot...")
                    self.capture_roblox_screenshot()
                    print("Waiting 30 seconds for next screenshot...")
                    time.sleep(30)
                else:
                    print("Natro Macro not running, checking again in 5 seconds...")
                    time.sleep(5)
                    
            except KeyboardInterrupt:
                print("\nStopping screenshot monitor...")
                self.running = False
                break
            except Exception as e:
                print(f"Error in monitoring loop: {e}")
                time.sleep(5)
    
    def stop_monitoring(self):
        """Stop the monitoring"""
        self.running = False

def main():
    print("=== Roblox Screenshot Monitor for Natro Macro ===")
    print("This script will:")
    print("1. Monitor for Natro Macro process")
    print("2. Take Roblox screenshots every 30 seconds while it's running")
    print("3. Save screenshots to D:\\Digital_Printers_Images")
    print("4. Press Ctrl+C to stop\n")
    
    monitor = RobloxScreenshotMonitor()
    
    try:
        monitor.start_monitoring()
    except KeyboardInterrupt:
        print("\nShutting down...")
    finally:
        monitor.stop_monitoring()
        print("Screenshot monitor stopped.")

if __name__ == "__main__":
    main()
