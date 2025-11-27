<html>
<head>
<style>
    body {
        background: linear-gradient(120deg, #a1c4fd, #c2e9fb);
        font-family: Verdana, sans-serif;
        text-align: center;
        padding: 50px;
        animation: fadeIn 1.5s ease-in-out;
    }

    h1, h2 {
        animation: float 3s ease-in-out infinite;
    }

    h1 {
        color: #1f4e79;
        text-shadow: 2px 2px #e6f0ff;
    }

    h2 {
        color: #16325c;
        text-shadow: 1px 1px #dae8ff;
    }

    @keyframes float {
        0%, 100% { transform: translateY(0px); }
        50% { transform: translateY(-8px); }
    }

    .message-box {
        margin-top: 40px;
        background: #ffffffaa;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 0 12px #8ab6f9;
        font-size: 18px;
        animation: slideUp 1.2s ease-out;
        display: inline-block;
    }

    @keyframes slideUp {
        from { opacity: 0; transform: translateY(25px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>

<body>

<h2>Welcome to the Jenkins and Tomcat Playground</h2>
<h1>Great to see you here</h1>
<h1>Building, deploying, improving every day</h1>
<h1>Make your work enjoyable and exciting</h1>

<div class="message-box">
    This is your space to create. <br>
    This is your space to learn. <br>
    This is your space to grow. <br>
    Make something amazing today.
</div>

</body>
</html>
