from PIL import Image
import os

input_path = "e:/Antigravity/HTwebsite/assets/HT Logo.png"
output_path = "e:/Antigravity/HTwebsite/assets/logo_small.png"

try:
    img = Image.open(input_path)
    # Resize to width 300px (maintain aspect ratio)
    current_w, current_h = img.size
    aspect_ratio = current_h / current_w
    new_w = 300
    new_h = int(new_w * aspect_ratio)
    
    img = img.resize((new_w, new_h), Image.Resampling.LANCZOS)
    
    # Save with optimization
    img.save(output_path, optimize=True, quality=85)
    
    print(f"Resized image saved to {output_path}")
    print(f"New size: {os.path.getsize(output_path)} bytes")
except Exception as e:
    print(f"Error: {e}")
