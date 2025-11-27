<html>
<head>
<title>Jenkins Modern Dashboard</title>

<style>
    /* Global Style */
    body {
        margin: 0;
        padding: 0;
        font-family: "Inter", sans-serif;
        background: linear-gradient(135deg, #0f172a, #1e293b);
        color: #e2e8f0;
    }

    header {
        padding: 40px 0;
        text-align: center;
        background: linear-gradient(90deg, #bc2c2c, #e84545);
        color: white;
        font-size: 40px;
        font-weight: 700;
        letter-spacing: 1px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.4);
        animation: slideDown 1s ease;
    }

    @keyframes slideDown {
        from { transform: translateY(-50px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }

    /* Main section */
    .intro {
        width: 70%;
        margin: 50px auto;
        text-align: center;
        font-size: 20px;
        line-height: 32px;
        background: rgba(255, 255, 255, 0.08);
        padding: 30px;
        border-radius: 15px;
        backdrop-filter: blur(10px);
        animation: fadeIn 1.5s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Feature grid */
    .section-title {
        margin-top: 60px;
        font-size: 32px;
        font-weight: 600;
        text-align: center;
        color: #f8fafc;
    }

    .grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 25px;
        width: 80%;
        margin: 30px auto;
    }

    .card {
        background: rgba(255, 255, 255, 0.08);
        padding: 25px;
        border-radius: 15px;
        backdrop-filter: blur(10px);
        color: #f1f5f9;
        transition: 0.3s ease;
        box-shadow: 0 4px 15px rgba(0,0,0,0.4);
        animation: cardPop 1.2s ease forwards;
        opacity: 0;
    }

    @keyframes cardPop {
        from { opacity: 0; transform: scale(0.9); }
        to { opacity: 1; transform: scale(1); }
    }

    .card:hover {
        transform: translateY(-10px);
        box-shadow: 0 10px 25px rgba(0,0,0,0.5);
        background: rgba(255, 255, 255, 0.15);
    }

    .card-title {
        font-size: 24px;
        margin-bottom: 10px;
        font-weight: 600;
        color: #ffffff;
    }

    footer {
        text-align: center;
        padding: 25px;
        margin-top: 60px;
        background: rgba(255,255,255,0.06);
        font-size: 16px;
        color: #cbd5e1;
        backdrop-filter: blur(8px);
    }
</style>
</head>

<body>

<header>Jenkins Modern Dashboard</header>

<div class="intro">
    Jenkins helps teams automate, build, test, and deploy software with confidence.  
    This modern dashboard showcases the strength, flexibility, and continuous power  
    of automation at every stage of development.
</div>

<div class="section-title">Core Capabilities</div>

<div class="grid">
    <div class="card">
        <div class="card-title">Pipeline Automation</div>
        Create end-to-end delivery flows that run consistently across all environments.
    </div>

    <div class="card">
        <div class="card-title">Scalable Architecture</div>
        Expand your build and deployment capacity with distributed agents and nodes.
    </div>

    <div class="card">
        <div class="card-title">Plugin Ecosystem</div>
        Integrate hundreds of tools and technologies to fit any workflow.
    </div>

    <div class="card">
        <div class="card-title">Reliable Builds</div>
        Predictable and repeatable results for every commit and every release.
    </div>

    <div class="card">
        <div class="card-title">Team Collaboration</div>
        Centralized build logs, tracking, and visibility for every team member.
    </div>

    <div class="card">
        <div class="card-title">Continuous Delivery</div>
        Deliver improvements faster with automated checks and real-time feedback.
    </div>
</div>

<footer>
    Powered by Jenkins • Building with automation, delivering with confidence
</footer>

</body>
</html>
