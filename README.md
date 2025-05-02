## How to Add New Assets (Backgrounds or Items) to the Collage

### Add the Asset File
Place your asset image (e.g., `doctor.png`) into the appropriate folder:
- For items: `res://Inventory/Items`
- For backgrounds: `res://Inventory/Backgrounds`

### Update the Collage Script
- Open the script at `res://Scripts/Collage.gd`.
- Inside the corresponding dictionary variable (`var items` for items, `var backgrounds` for backgrounds), add an entry for your new asset. Use the file name as the key and a dictionary of attributes as the value.

### Example
To add a "Doctor" item described as extremely evil (dark: -4.0), very distant (cold: -3.0), emotionally neutral (mood: 0.0), and slightly inspiring (inspiring: 1.0), add the following entry to `var items`:
```"doctor.png": {-4.0, -3.0, 0.0, 1.0}```
