$template = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="referrer" content="strict-origin-when-cross-origin" />
    <title>Thali by Thali - Episode {{ID}}</title>
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
</head>
<body>

    <!-- Header -->
    <header>
        <div class="container">
            <nav>
                <div class="logo">
                     <img src="../assets/logo_small.png" alt="Thali by Thali" style="height: 50px; width: auto;">
                </div>
                <ul class="nav-links">
                    <li><a href="../index.html">Home</a></li>
                    <li><a href="../about.html">About Us</a></li>
                    <li><a href="../projects.html" class="active">Projects</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Video Section -->
    <section class="section">
        <div class="container video-detail">
            <div class="video-header">
                <h1>Episode {{ID}}: {{TITLE}}</h1>
                <p><a href="../projects.html">&larr; Back to all episodes</a></p>
            </div>

            <!-- Top Video Link / Embed -->
            <div class="video-container">
                <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/{{VIDEO_ID}}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>

            <div style="margin-top: 2rem;">
                <h3>About this Episode</h3>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. In Episode {{ID}}, we explore the intricacies of {{TOPIC}}. 
                    Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada.
                </p>
            </div>

            <div class="video-resources">
                <h3>Learning Resources</h3>
                <ul>
                    <li><a href="#">Read about {{TOPIC}} history</a></li>
                    <li><a href="#">Recipe: Traditional {{TOPIC}}</a></li>
                    <li><a href="#">Interview with the chef</a></li>
                </ul>
            </div>

            <!-- Bottom Video Link (Navigation) -->
            <div class="video-bottom-link">
                {{NAV_LINKS}}
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2026 Thali by Thali. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>
"@

$topics = @(
    "What were the Harappan's eating?", 
    "What were people eating in Early India?", 
    "What were people eating in Early Southern India?", 
    "What were people in the Gupta Empire eating?"
)

$videoIds = @(
    "m8q-ZZzH0PQ",
    "uSSAy85boBU",
    "oDUc-MSe3hM",
    "wuocBJIOXpI"
)

# Loop only up to 4 as we only have 4 videos ready
for ($i = 1; $i -le 4; $i++) {
    $topic = $topics[$i-1]
    $videoId = $videoIds[$i-1]
    
    $content = $template -replace "\{\{ID\}\}", "$i"
    $content = $content -replace "\{\{TITLE\}\}", "$topic"
    $content = $content -replace "\{\{TOPIC\}\}", "$topic"
    $content = $content -replace "\{\{VIDEO_ID\}\}", "$videoId"

    # Navigation Logic
    $navLinks = ""
    if ($i -gt 1) {
        $prev = $i - 1
        $navLinks += "<a href='video-$prev.html' style='margin-right: 20px;'>&larr; Previous Episode</a>"
    } else {
         $navLinks += "<span style='margin-right: 20px; color: #ccc;'>&larr; Previous Episode</span>"
    }

    if ($i -lt 4) {
        $next = $i + 1
        $navLinks += "<a href='video-$next.html' style='font-weight: bold;'>Next Episode &rarr;</a>"
    } else {
         # Last available video loops back to projects
         $navLinks += "<a href='../projects.html' style='font-weight: bold;'>Back to Project List &rarr;</a>"
    }

    $content = $content -replace "\{\{NAV_LINKS\}\}", "$navLinks"

    $fileName = "videos/video-$i.html"
    Set-Content -Path $fileName -Value $content
    Write-Host "Created $fileName"
}
