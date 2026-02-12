# Thali by Thali

A static website for the "Thali by Thali" video series, exploring Indian history through the lens of food.

## Project Structure

- `index.html`: Home page with playlist embed and project overview.
- `about.html`: About the project and team.
- `projects.html`: List of all episodes.
- `videos/`: Individual pages for each of the 15 episodes (currently episodes 1-4 are live).
- `css/`: Stylesheets.
- `js/`: Scripts (currently empty).
- `images/`: Project assets.

## Development

The video pages are generated using a PowerShell script to ensure consistency.

### Adding New Episodes

1. Open `generate_videos.ps1`.
2. Update the `$topics` and `$videoIds` arrays with new content.
3. Update the loop range (e.g., `$i -le 5`).
4. Run the script:
   ```powershell
   .\generate_videos.ps1
   ```
5. Uncomment the videos in `projects.html`.

## Credits

Developed for the Historically Tempered Collective.
