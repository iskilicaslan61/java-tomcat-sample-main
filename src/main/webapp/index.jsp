<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Jenkins Learning WebApp</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background: #f5f5f5;
    }
    h1 {
      font-size: 32px;
      margin-bottom: 10px;
    }
    .card {
      background: white;
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
      margin-bottom: 20px;
    }
    .btn {
      padding: 10px 16px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-weight: bold;
      margin-right: 10px;
    }
    .btn.primary { background: #007bff; color: white; }
    .btn.outline {
      background: transparent;
      border: 2px solid #007bff;
      color: #007bff;
    }
    .btn.red { background: #e53935; color: white; }
    select, input[type=range] {
      padding: 8px;
      border-radius: 8px;
      border: 1px solid #ccc;
      width: 250px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
    }
    th, td {
      padding: 12px;
      border-bottom: 1px solid #ddd;
      text-align: left;
    }
    .slider-value {
      margin-top: 10px;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <h1>Jenkins Learning WebApp</h1>
  <p>Interactive learning page with HTML, CSS, and JavaScript.</p>

  <!-- Difficulty Selector -->
  <div class="card">
    <h2>Select Learning Level</h2>
    <select id="difficulty">
      <option value="beginner">Beginner</option>
      <option value="intermediate">Intermediate</option>
      <option value="advanced">Advanced</option>
    </select>
  </div>

  <!-- Slider -->
  <div class="card">
    <h2>Adjust Example Complexity</h2>
    <input type="range" id="complexitySlider" min="0" max="100" value="50" />
    <p class="slider-value">Complexity: <span id="sliderValue">50</span></p>
  </div>

  <!-- Buttons -->
  <div class="card">
    <h2>Actions</h2>
    <button class="btn primary" onclick="showExamples()">View Jenkins Examples</button>
    <button class="btn outline" onclick="downloadFile()">Download Jenkinsfile</button>
    <button class="btn red" onclick="resetPage()">Reset Page</button>
  </div>

  <!-- Table -->
  <div class="card">
    <h2>Pipeline Examples Table</h2>
    <table>
      <thead>
        <tr>
          <th>Type</th>
          <th>Purpose</th>
          <th>Difficulty</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Freestyle Job</td>
          <td>Basic CI tasks</td>
          <td>Beginner</td>
        </tr>
        <tr>
          <td>Declarative Pipeline</td>
          <td>Automatic build/test/deploy</td>
          <td>Intermediate</td>
        </tr>
        <tr>
          <td>Docker Pipeline</td>
          <td>CI with containers</td>
          <td>Advanced</td>
        </tr>
      </tbody>
    </table>
  </div>

  <!-- Info Section -->
  <div class="card">
    <h2>Jenkins Quick Info</h2>
    <p>• Jenkins automates CI/CD workflows.</p>
    <p>• Supports pipelines, webhooks, plugins, and Docker builds.</p>
    <p>• Works with GitHub, GitLab, Bitbucket and more.</p>
  </div>

  <script>
    // Slider update
    const slider = document.getElementById('complexitySlider');
    const sliderValue = document.getElementById('sliderValue');

    slider.addEventListener('input', () => {
      sliderValue.textContent = slider.value;
    });

    function showExamples() {
      alert('Showing Jenkins examples...');
    }

    function downloadFile() {
      const data = `pipeline {\n    agent any\n    stages {\n        stage('Build') { steps { echo "Building" } }\n    }\n}`;
      const blob = new Blob([data], { type: 'text/plain' });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = 'Jenkinsfile';
      a.click();
    }

    function resetPage() {
      document.getElementById('difficulty').value = 'beginner';
      slider.value = 50;
      sliderValue.textContent = 50;
      alert('Page reset!');
    }
  </script>
</body>
</html>
