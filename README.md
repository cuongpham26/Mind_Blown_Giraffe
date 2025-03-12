## Overview
The project currently consists of two scenes: `collage_editor.tscn` and `title_screen.tscn`. The `title_screen.tscn` serves as the main entry point, allowing users to access the collage editor or exit the application.


## Features
- The `title_screen.tscn`provides navigation options to enter `collage_editor.tscn` or quit the project.
- Within `collage_editor.tscn`, users can drag images from the sidebar into the canvas.
- Users can resize images by either right-clicking or using the middle mouse button.


## Bugs
- The `image.gd script` appears to trigger the debugger around 100 times/second, likely due to `tween`. It doesn't seem to affect our program but it's worth looking into.
- Enlarging an image in the sidebar also enlarges the corresponding image on the canvas.
- If two images are stacked, moving one will cause both to move together instead of just the top image.
