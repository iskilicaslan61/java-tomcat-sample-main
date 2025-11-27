<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jenkins Learning Hub - Master CI/CD</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary-blue: #1e3a8a;
            --secondary-blue: #2563eb;
            --light-blue: #3b82f6;
            --lighter-blue: #60a5fa;
            --pale-blue: #dbeafe;
            --dark-blue: #1e40af;
            --navy: #0f172a;
            --text-dark: #1e293b;
            --text-light: #f1f5f9;
            --white: #ffffff;
            --gray: #64748b;
            --light-gray: #f8fafc;
            --primary-green: #10b981;
            --secondary-green: #34d399;
            --light-green: #6ee7b7;
            --lighter-green: #a7f3d0;
            --pale-green: #d1fae5;
            --dark-green: #059669;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: var(--text-dark);
            background-color: var(--light-gray);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .navbar {
            background: linear-gradient(135deg, var(--primary-blue) 0%, var(--dark-blue) 100%);
            color: var(--white);
            padding: 1rem 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(30, 58, 138, 0.3);
        }

        .navbar .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .nav-brand h1 {
            font-size: 1.5rem;
            font-weight: 700;
        }

        .nav-menu {
            display: flex;
            list-style: none;
            gap: 2rem;
        }

        .nav-link {
            color: var(--white);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
            position: relative;
        }

        .nav-link:hover,
        .nav-link.active {
            color: var(--lighter-blue);
        }

        .nav-link::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 2px;
            background-color: var(--lighter-blue);
            transition: width 0.3s ease;
        }

        .nav-link:hover::after,
        .nav-link.active::after {
            width: 100%;
        }

        .hero {
            background: linear-gradient(135deg, var(--primary-green) 0%, var(--secondary-green) 50%, var(--light-green) 100%);
            color: var(--white);
            padding: 150px 0 100px;
            text-align: center;
            margin-top: 60px;
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -10%;
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.15) 0%, transparent 70%);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }

        .hero::after {
            content: '';
            position: absolute;
            bottom: -30%;
            right: -5%;
            width: 400px;
            height: 400px;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
            border-radius: 50%;
            animation: float 8s ease-in-out infinite;
            animation-delay: 2s;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0) translateX(0);
            }
            50% {
                transform: translateY(-30px) translateX(20px);
            }
        }

        .hero .shape {
            position: absolute;
            opacity: 0.1;
        }

        .hero .shape-1 {
            top: 10%;
            left: 10%;
            width: 80px;
            height: 80px;
            border: 3px solid white;
            border-radius: 20px;
            transform: rotate(45deg);
            animation: rotate 10s linear infinite;
        }

        .hero .shape-2 {
            top: 60%;
            left: 80%;
            width: 60px;
            height: 60px;
            border: 3px solid white;
            border-radius: 50%;
            animation: pulse 3s ease-in-out infinite;
        }

        .hero .shape-3 {
            top: 30%;
            right: 15%;
            width: 0;
            height: 0;
            border-left: 40px solid transparent;
            border-right: 40px solid transparent;
            border-bottom: 70px solid rgba(255, 255, 255, 0.15);
            animation: float 7s ease-in-out infinite;
        }

        .hero .shape-4 {
            bottom: 20%;
            left: 15%;
            width: 100px;
            height: 100px;
            background: linear-gradient(45deg, transparent 40%, rgba(255, 255, 255, 0.1) 40%, rgba(255, 255, 255, 0.1) 60%, transparent 60%);
            animation: rotate 15s linear infinite reverse;
        }

        @keyframes rotate {
            from {
                transform: rotate(0deg);
            }
            to {
                transform: rotate(360deg);
            }
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
                opacity: 0.1;
            }
            50% {
                transform: scale(1.2);
                opacity: 0.2;
            }
        }

        .hero-content {
            position: relative;
            z-index: 1;
        }

        .hero-content h2 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
            animation: fadeInUp 1s ease;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            font-weight: 800;
        }

        .hero-content p {
            font-size: 1.4rem;
            margin-bottom: 2.5rem;
            opacity: 0.95;
            animation: fadeInUp 1s ease 0.2s backwards;
            text-shadow: 0 1px 5px rgba(0, 0, 0, 0.15);
        }

        .hero-icons {
            position: absolute;
            font-size: 2.5rem;
            opacity: 0.15;
            animation: float 5s ease-in-out infinite;
        }

        .icon-1 {
            top: 15%;
            right: 20%;
            animation-delay: 0s;
        }

        .icon-2 {
            bottom: 25%;
            left: 25%;
            animation-delay: 1s;
        }

        .icon-3 {
            top: 40%;
            left: 15%;
            animation-delay: 2s;
        }

        .icon-4 {
            bottom: 35%;
            right: 25%;
            animation-delay: 1.5s;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .btn-primary {
            background-color: var(--white);
            color: var(--primary-green);
            padding: 14px 35px;
            border: none;
            border-radius: 30px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 6px 20px rgba(255, 255, 255, 0.3);
            letter-spacing: 0.5px;
        }

        .btn-primary:hover {
            background-color: var(--dark-green);
            color: var(--white);
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 25px rgba(255, 255, 255, 0.4);
        }

        .btn-secondary {
            background-color: var(--gray);
            color: var(--white);
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: var(--text-dark);
            transform: translateY(-2px);
        }

        .section {
            padding: 80px 0;
        }

        .section-dark {
            background: linear-gradient(135deg, var(--navy) 0%, var(--primary-blue) 100%);
            color: var(--white);
        }

        .section-title {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 3rem;
            color: var(--primary-blue);
            position: relative;
            padding-bottom: 1rem;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(90deg, var(--light-blue), var(--lighter-blue), var(--light-blue));
            border-radius: 2px;
        }

        .section-dark .section-title {
            color: var(--white);
        }

        .section-dark .section-title::after {
            background: linear-gradient(90deg, var(--lighter-blue), var(--pale-blue), var(--lighter-blue));
        }

        .section-subtitle {
            text-align: center;
            font-size: 1.1rem;
            color: var(--gray);
            margin-top: -2rem;
            margin-bottom: 3rem;
            font-weight: 400;
        }

        .cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }

        .card {
            background: var(--white);
            padding: 2rem;
            border-radius: 12px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(30, 58, 138, 0.1);
            border: 2px solid transparent;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 30px rgba(30, 58, 138, 0.2);
            border-color: var(--light-blue);
        }

        .card-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
            filter: grayscale(0%);
            transition: transform 0.3s ease;
        }

        .card:hover .card-icon {
            transform: scale(1.2) rotate(5deg);
        }

        .card h3 {
            color: var(--primary-blue);
            margin-bottom: 0.5rem;
            font-size: 1.3rem;
        }

        .card p {
            color: var(--gray);
        }

        .pipeline-content {
            max-width: 900px;
            margin: 0 auto;
        }

        .pipeline-tabs {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .tab-btn {
            background-color: rgba(255, 255, 255, 0.1);
            color: var(--white);
            padding: 12px 24px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .tab-btn:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        .tab-btn.active {
            background-color: var(--light-blue);
            border-color: var(--light-blue);
        }

        .tab-content {
            display: none;
            animation: fadeIn 0.5s ease;
        }

        .tab-content.active {
            display: block;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .tab-content h3 {
            margin-bottom: 1rem;
            font-size: 1.8rem;
        }

        .tab-content pre {
            background-color: rgba(0, 0, 0, 0.3);
            padding: 1.5rem;
            border-radius: 8px;
            overflow-x: auto;
            margin: 1.5rem 0;
            border-left: 4px solid var(--light-blue);
        }

        .tab-content code {
            color: var(--pale-blue);
            font-family: 'Courier New', monospace;
            font-size: 0.9rem;
            line-height: 1.6;
        }

        .tab-content ul {
            margin-left: 2rem;
            margin-top: 1rem;
        }

        .tab-content li {
            margin-bottom: 0.5rem;
        }

        .tips-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 2.5rem;
            margin-bottom: 4rem;
        }

        .tip-card {
            background: linear-gradient(145deg, var(--light-blue) 0%, var(--secondary-blue) 50%, var(--dark-blue) 100%);
            color: var(--white);
            padding: 2.5rem;
            border-radius: 16px;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(30, 58, 138, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .tip-card::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.15) 0%, transparent 70%);
            opacity: 0;
            transition: opacity 0.4s ease;
        }

        .tip-card::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, var(--lighter-blue), var(--pale-blue), var(--lighter-blue));
            transform: scaleX(0);
            transform-origin: left;
            transition: transform 0.4s ease;
        }

        .tip-card:hover::before {
            opacity: 1;
        }

        .tip-card:hover::after {
            transform: scaleX(1);
        }

        .tip-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 15px 40px rgba(30, 58, 138, 0.4);
        }

        .tip-number {
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0.1));
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            border: 2px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .tip-card:hover .tip-number {
            transform: rotate(360deg) scale(1.1);
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.4), rgba(255, 255, 255, 0.2));
        }

        .tip-card h3 {
            margin-bottom: 1rem;
            font-size: 1.4rem;
            font-weight: 600;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .tip-card p {
            line-height: 1.7;
            font-size: 0.95rem;
            opacity: 0.95;
        }

        .common-commands {
            background: linear-gradient(135deg, var(--white) 0%, var(--pale-blue) 100%);
            padding: 3.5rem;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(30, 58, 138, 0.15);
            border: 2px solid rgba(59, 130, 246, 0.1);
            margin-top: 3rem;
        }

        .common-commands h3 {
            color: var(--primary-blue);
            margin-bottom: 2.5rem;
            font-size: 2rem;
            text-align: center;
            font-weight: 700;
            text-shadow: 0 2px 4px rgba(30, 58, 138, 0.1);
        }

        .commands-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
        }

        .command-item {
            background: var(--white);
            padding: 1.8rem;
            border-radius: 12px;
            border-left: 5px solid var(--light-blue);
            transition: all 0.3s ease;
            box-shadow: 0 3px 10px rgba(30, 58, 138, 0.08);
            position: relative;
            overflow: hidden;
        }

        .command-item::before {
            content: '💡';
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 1.2rem;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .command-item:hover::before {
            opacity: 0.3;
        }

        .command-item:hover {
            background: linear-gradient(135deg, var(--light-blue), var(--secondary-blue));
            color: var(--white);
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(30, 58, 138, 0.25);
            border-left-color: var(--lighter-blue);
        }

        .command-item code {
            display: block;
            color: var(--primary-blue);
            font-weight: 700;
            margin-bottom: 0.7rem;
            font-size: 1rem;
            font-family: 'Courier New', monospace;
        }

        .command-item:hover code {
            color: var(--white);
        }

        .command-item p {
            font-size: 0.9rem;
            color: var(--gray);
            line-height: 1.5;
        }

        .command-item:hover p {
            color: var(--white);
        }

        .quiz-container {
            max-width: 700px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.1);
            padding: 3rem;
            border-radius: 12px;
            backdrop-filter: blur(10px);
        }

        .quiz-question h3 {
            margin-bottom: 2rem;
            font-size: 1.5rem;
        }

        #answers-container {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .answer-option {
            background: rgba(255, 255, 255, 0.15);
            padding: 1rem;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }

        .answer-option:hover {
            background: rgba(255, 255, 255, 0.25);
            border-color: var(--lighter-blue);
        }

        .answer-option.selected {
            background: var(--light-blue);
            border-color: var(--light-blue);
        }

        .answer-option.correct {
            background: #10b981;
            border-color: #10b981;
        }

        .answer-option.incorrect {
            background: #ef4444;
            border-color: #ef4444;
        }

        .quiz-controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 2rem;
        }

        #question-counter {
            font-weight: 600;
            font-size: 1.1rem;
        }

        #quiz-results {
            text-align: center;
        }

        #quiz-results h3 {
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .score-display {
            font-size: 1.5rem;
            margin: 2rem 0;
        }

        #final-score {
            color: var(--lighter-blue);
            font-weight: 700;
            font-size: 2rem;
        }

        .hidden {
            display: none;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 2000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(5px);
        }

        .modal-content {
            background: linear-gradient(135deg, var(--white) 0%, var(--pale-blue) 100%);
            margin: 5% auto;
            padding: 2rem;
            border-radius: 12px;
            width: 80%;
            max-width: 700px;
            max-height: 80vh;
            overflow-y: auto;
            animation: slideDown 0.3s ease;
            box-shadow: 0 10px 50px rgba(30, 58, 138, 0.3);
        }

        @keyframes slideDown {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .close {
            color: var(--gray);
            float: right;
            font-size: 2rem;
            font-weight: bold;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .close:hover {
            color: var(--primary-blue);
        }

        #modal-body h2 {
            color: var(--primary-blue);
            margin-bottom: 1rem;
        }

        #modal-body p {
            margin-bottom: 1rem;
            line-height: 1.8;
        }

        #modal-body ul {
            margin-left: 2rem;
            margin-bottom: 1rem;
        }

        #modal-body li {
            margin-bottom: 0.5rem;
        }

        #modal-body code {
            background-color: var(--pale-blue);
            color: var(--primary-blue);
            padding: 2px 6px;
            border-radius: 4px;
            font-family: 'Courier New', monospace;
        }

        .footer {
            background: linear-gradient(135deg, var(--primary-blue) 0%, var(--dark-blue) 100%);
            color: var(--white);
            text-align: center;
            padding: 2rem 0;
        }

        @media (max-width: 768px) {
            .nav-menu {
                flex-direction: column;
                gap: 1rem;
            }

            .hero-content h2 {
                font-size: 2.2rem;
            }

            .hero-content p {
                font-size: 1.1rem;
            }

            .hero-icons {
                display: none;
            }

            .hero .shape {
                display: none;
            }

            .btn-primary {
                padding: 12px 28px;
                font-size: 1rem;
            }

            .section-title {
                font-size: 2rem;
            }

            .cards-grid,
            .tips-container,
            .commands-grid {
                grid-template-columns: 1fr;
            }

            .pipeline-tabs {
                flex-direction: column;
            }

            .modal-content {
                width: 95%;
                margin: 10% auto;
            }
        }

        ::-webkit-scrollbar {
            width: 10px;
        }

        ::-webkit-scrollbar-track {
            background: var(--light-gray);
        }

        ::-webkit-scrollbar-thumb {
            background: var(--light-blue);
            border-radius: 5px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: var(--secondary-blue);
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="container">
            <div class="nav-brand">
                <h1>Jenkins Learning Hub</h1>
            </div>
            <ul class="nav-menu">
                <li><a href="#home" class="nav-link active">Home</a></li>
                <li><a href="#basics" class="nav-link">Basics</a></li>
                <li><a href="#pipeline" class="nav-link">Pipeline</a></li>
                <li><a href="#tips" class="nav-link">Tips & Tricks</a></li>
                <li><a href="#quiz" class="nav-link">Quiz</a></li>
            </ul>
        </div>
    </nav>

    <section id="home" class="hero">
        <div class="shape shape-1"></div>
        <div class="shape shape-2"></div>
        <div class="shape shape-3"></div>
        <div class="shape shape-4"></div>
        <div class="hero-icons icon-1">⚙️</div>
        <div class="hero-icons icon-2">🚀</div>
        <div class="hero-icons icon-3">📦</div>
        <div class="hero-icons icon-4">🔧</div>
        <div class="container">
            <div class="hero-content">
                <h2>Master Jenkins CI/CD</h2>
                <p>Your complete guide to Jenkins automation, pipelines, and continuous integration</p>
                <button class="btn-primary" onclick="scrollToSection('basics')">Start Learning</button>
            </div>
        </div>
    </section>

    <section id="basics" class="section">
        <div class="container">
            <h2 class="section-title">Jenkins Basics</h2>
            <div class="cards-grid">
                <div class="card" onclick="showModal('what-is-jenkins')">
                    <div class="card-icon">🚀</div>
                    <h3>What is Jenkins?</h3>
                    <p>Learn about Jenkins and its role in CI/CD</p>
                </div>
                <div class="card" onclick="showModal('installation')">
                    <div class="card-icon">⚙️</div>
                    <h3>Installation</h3>
                    <p>Step-by-step installation guide</p>
                </div>
                <div class="card" onclick="showModal('architecture')">
                    <div class="card-icon">🏗️</div>
                    <h3>Architecture</h3>
                    <p>Understanding Jenkins architecture</p>
                </div>
                <div class="card" onclick="showModal('jobs')">
                    <div class="card-icon">📋</div>
                    <h3>Jobs & Builds</h3>
                    <p>Creating and managing Jenkins jobs</p>
                </div>
            </div>
        </div>
    </section>

    <section id="pipeline" class="section section-dark">
        <div class="container">
            <h2 class="section-title">Jenkins Pipeline</h2>
            <div class="pipeline-content">
                <div class="pipeline-tabs">
                    <button class="tab-btn active" onclick="showTab('declarative')">Declarative Pipeline</button>
                    <button class="tab-btn" onclick="showTab('scripted')">Scripted Pipeline</button>
                    <button class="tab-btn" onclick="showTab('multibranch')">Multibranch</button>
                </div>
                <div id="declarative" class="tab-content active">
                    <h3>Declarative Pipeline</h3>
                    <pre><code>pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh './deploy.sh'
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}</code></pre>
                    <p>Declarative Pipeline provides a more structured and simpler syntax for defining pipelines.</p>
                </div>
                <div id="scripted" class="tab-content">
                    <h3>Scripted Pipeline</h3>
                    <pre><code>node {
    stage('Build') {
        echo 'Building...'
        sh 'mvn clean package'
    }

    stage('Test') {
        echo 'Testing...'
        sh 'mvn test'
    }

    stage('Deploy') {
        echo 'Deploying...'
        sh './deploy.sh'
    }
}</code></pre>
                    <p>Scripted Pipeline offers more flexibility and is written in Groovy.</p>
                </div>
                <div id="multibranch" class="tab-content">
                    <h3>Multibranch Pipeline</h3>
                    <p>Multibranch Pipeline automatically creates a pipeline for each branch in your repository.</p>
                    <ul>
                        <li>Automatically discovers branches with Jenkinsfile</li>
                        <li>Creates separate pipeline for each branch</li>
                        <li>Supports pull request builds</li>
                        <li>Branch indexing and automatic cleanup</li>
                    </ul>
                    <pre><code>// Jenkinsfile in repository root
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo "Building branch: ${env.BRANCH_NAME}"
            }
        }
    }
}</code></pre>
                </div>
            </div>
        </div>
    </section>

    <section id="tips" class="section">
        <div class="container">
            <h2 class="section-title">Tips & Best Practices</h2>
            <p class="section-subtitle">Master Jenkins with these proven strategies and expert recommendations</p>
            <div class="tips-container">
                <div class="tip-card">
                    <div class="tip-number">1</div>
                    <h3>Use Pipeline as Code</h3>
                    <p>Store your Jenkinsfile in version control alongside your code for better maintainability and versioning.</p>
                </div>
                <div class="tip-card">
                    <div class="tip-number">2</div>
                    <h3>Implement Proper Error Handling</h3>
                    <p>Always use try-catch blocks and post conditions to handle failures gracefully and send notifications.</p>
                </div>
                <div class="tip-card">
                    <div class="tip-number">3</div>
                    <h3>Use Shared Libraries</h3>
                    <p>Create reusable pipeline code with Jenkins Shared Libraries to reduce duplication across projects.</p>
                </div>
                <div class="tip-card">
                    <div class="tip-number">4</div>
                    <h3>Secure Your Credentials</h3>
                    <p>Never hardcode credentials. Use Jenkins Credentials Manager and reference them securely in pipelines.</p>
                </div>
                <div class="tip-card">
                    <div class="tip-number">5</div>
                    <h3>Parallel Execution</h3>
                    <p>Use parallel stages to speed up your pipeline execution when tasks are independent.</p>
                </div>
                <div class="tip-card">
                    <div class="tip-number">6</div>
                    <h3>Keep Agents Clean</h3>
                    <p>Use workspace cleanup and Docker agents to ensure consistent and clean build environments.</p>
                </div>
                <div class="tip-card">
                    <div class="tip-number">7</div>
                    <h3>Monitor & Optimize</h3>
                    <p>Regularly review pipeline metrics, optimize slow stages, and archive only necessary artifacts.</p>
                </div>
                <div class="tip-card">
                    <div class="tip-number">8</div>
                    <h3>Implement Blue-Green Deployments</h3>
                    <p>Use Jenkins to orchestrate blue-green or canary deployments for zero-downtime releases.</p>
                </div>
            </div>

            <div class="common-commands">
                <h3>Common Jenkins Commands & Concepts</h3>
                <div class="commands-grid">
                    <div class="command-item">
                        <code>sh 'command'</code>
                        <p>Execute shell commands</p>
                    </div>
                    <div class="command-item">
                        <code>checkout scm</code>
                        <p>Check out source code</p>
                    </div>
                    <div class="command-item">
                        <code>withCredentials</code>
                        <p>Use credentials securely</p>
                    </div>
                    <div class="command-item">
                        <code>archiveArtifacts</code>
                        <p>Save build artifacts</p>
                    </div>
                    <div class="command-item">
                        <code>junit</code>
                        <p>Publish test results</p>
                    </div>
                    <div class="command-item">
                        <code>emailext</code>
                        <p>Send email notifications</p>
                    </div>
                    <div class="command-item">
                        <code>timeout</code>
                        <p>Set stage timeout</p>
                    </div>
                    <div class="command-item">
                        <code>retry</code>
                        <p>Retry failed steps</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="quiz" class="section section-dark">
        <div class="container">
            <h2 class="section-title">Test Your Knowledge</h2>
            <div class="quiz-container">
                <div id="quiz-content">
                    <div class="quiz-question">
                        <h3 id="question-text">Question will appear here</h3>
                        <div id="answers-container"></div>
                    </div>
                    <div class="quiz-controls">
                        <button class="btn-secondary" onclick="previousQuestion()">Previous</button>
                        <span id="question-counter">1 / 5</span>
                        <button class="btn-primary" onclick="nextQuestion()">Next</button>
                    </div>
                </div>
                <div id="quiz-results" class="hidden">
                    <h3>Quiz Complete!</h3>
                    <p class="score-display">Your Score: <span id="final-score">0</span> / 5</p>
                    <button class="btn-primary" onclick="restartQuiz()">Restart Quiz</button>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 Jenkins Learning Hub. Master CI/CD with Jenkins.</p>
        </div>
    </footer>

    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <div id="modal-body"></div>
        </div>
    </div>

    <script>
        const modalContent = {
            'what-is-jenkins': {
                title: 'What is Jenkins?',
                content: `
                    <p>Jenkins is an open-source automation server that enables developers to build, test, and deploy their software reliably and efficiently. It's the leading tool for Continuous Integration and Continuous Delivery (CI/CD).</p>

                    <h3>Key Features:</h3>
                    <ul>
                        <li><strong>Easy Installation:</strong> Self-contained Java-based program, ready to run on Windows, macOS, and Linux</li>
                        <li><strong>Easy Configuration:</strong> Web-based interface with extensive error checks and built-in help</li>
                        <li><strong>Plugins:</strong> Over 1,800 plugins in the Update Center, integrating with virtually every tool in the CI/CD toolchain</li>
                        <li><strong>Extensible:</strong> Can be extended via its plugin architecture</li>
                        <li><strong>Distributed:</strong> Easily distributes work across multiple machines for faster builds, tests, and deployments</li>
                    </ul>

                    <h3>Why Use Jenkins?</h3>
                    <ul>
                        <li>Automate repetitive tasks</li>
                        <li>Catch bugs early in the development cycle</li>
                        <li>Accelerate software delivery</li>
                        <li>Improve team collaboration</li>
                        <li>Increase deployment frequency</li>
                        <li>Reduce time to market</li>
                    </ul>
                `
            },
            'installation': {
                title: 'Installing Jenkins',
                content: `
                    <h3>Prerequisites:</h3>
                    <ul>
                        <li>Java 11 or Java 17 (Long-Term Support release)</li>
                        <li>Minimum 256 MB RAM (1 GB+ recommended)</li>
                        <li>10 GB of drive space</li>
                    </ul>

                    <h3>Installation Methods:</h3>

                    <h4>1. Docker (Recommended)</h4>
                    <code>docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts</code>

                    <h4>2. Linux (Ubuntu/Debian)</h4>
                    <code>
sudo apt update<br>
sudo apt install openjdk-11-jdk<br>
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -<br>
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'<br>
sudo apt update<br>
sudo apt install jenkins<br>
sudo systemctl start jenkins
                    </code>

                    <h4>3. Windows</h4>
                    <p>Download the Windows installer from jenkins.io and run the setup wizard.</p>

                    <h4>4. macOS</h4>
                    <code>brew install jenkins-lts<br>brew services start jenkins-lts</code>

                    <h3>Initial Setup:</h3>
                    <ol>
                        <li>Access Jenkins at <code>http://localhost:8080</code></li>
                        <li>Retrieve the initial admin password from the specified location</li>
                        <li>Install suggested plugins or select specific plugins</li>
                        <li>Create your first admin user</li>
                        <li>Configure Jenkins URL</li>
                        <li>Start using Jenkins!</li>
                    </ol>
                `
            },
            'architecture': {
                title: 'Jenkins Architecture',
                content: `
                    <h3>Master-Agent Architecture</h3>
                    <p>Jenkins uses a master-agent (formerly master-slave) architecture to manage distributed builds.</p>

                    <h4>Jenkins Master (Controller):</h4>
                    <ul>
                        <li>Serves as the central control unit</li>
                        <li>Handles scheduling build jobs</li>
                        <li>Dispatches builds to agents for execution</li>
                        <li>Monitors agents and collects results</li>
                        <li>Hosts the Jenkins UI</li>
                        <li>Manages configuration and plugins</li>
                    </ul>

                    <h4>Jenkins Agents (Nodes):</h4>
                    <ul>
                        <li>Execute build jobs dispatched by the master</li>
                        <li>Can run on various operating systems</li>
                        <li>Can be physical machines, VMs, or Docker containers</li>
                        <li>Connected via SSH, JNLP, or other protocols</li>
                        <li>Allow parallel execution of builds</li>
                    </ul>

                    <h3>Key Components:</h3>
                    <ul>
                        <li><strong>Jobs/Projects:</strong> Runnable tasks (builds, tests, deployments)</li>
                        <li><strong>Builds:</strong> Individual executions of a job</li>
                        <li><strong>Workspace:</strong> Dedicated directory for each job on an agent</li>
                        <li><strong>Executors:</strong> Slots for running builds on an agent</li>
                        <li><strong>Plugins:</strong> Extend Jenkins functionality</li>
                        <li><strong>Views:</strong> Organize and display jobs</li>
                    </ul>

                    <h3>Pipeline Execution:</h3>
                    <p>Modern Jenkins uses pipelines defined as code (Jenkinsfile) which can be version controlled and shared across projects.</p>
                `
            },
            'jobs': {
                title: 'Jenkins Jobs & Builds',
                content: `
                    <h3>Types of Jenkins Jobs:</h3>

                    <h4>1. Freestyle Project</h4>
                    <p>The simplest and most flexible job type. Configure via UI with build steps, triggers, and post-build actions.</p>

                    <h4>2. Pipeline</h4>
                    <p>Define your build process as code using Groovy. Supports complex workflows and version control.</p>

                    <h4>3. Multibranch Pipeline</h4>
                    <p>Automatically creates pipelines for each branch in your repository. Perfect for feature branch workflows.</p>

                    <h4>4. Organization Folder</h4>
                    <p>Scans an entire GitHub/Bitbucket organization and creates multibranch pipelines for each repository.</p>

                    <h4>5. Multi-configuration Project</h4>
                    <p>Build and test the same project in different environments or configurations.</p>

                    <h3>Creating a Simple Job:</h3>
                    <ol>
                        <li>Click "New Item" from the Jenkins dashboard</li>
                        <li>Enter a job name and select job type</li>
                        <li>Configure Source Code Management (Git, SVN, etc.)</li>
                        <li>Set build triggers (Poll SCM, GitHub webhook, etc.)</li>
                        <li>Add build steps (shell commands, Maven goals, etc.)</li>
                        <li>Configure post-build actions (archive artifacts, notifications)</li>
                        <li>Save and run the job</li>
                    </ol>

                    <h3>Build Triggers:</h3>
                    <ul>
                        <li><strong>Poll SCM:</strong> Periodically check for changes (e.g., H/5 * * * *)</li>
                        <li><strong>GitHub hook trigger:</strong> Trigger on push/PR events</li>
                        <li><strong>Build periodically:</strong> Run on a schedule (e.g., H 0 * * *)</li>
                        <li><strong>Trigger builds remotely:</strong> Via API with authentication token</li>
                        <li><strong>Build after other projects:</strong> Chain jobs together</li>
                    </ul>

                    <h3>Build Parameters:</h3>
                    <p>Make jobs configurable with parameters like strings, choices, booleans, files, etc.</p>
                `
            }
        };

        const quizData = [
            {
                question: "What is Jenkins primarily used for?",
                answers: [
                    "Database management",
                    "Continuous Integration and Continuous Delivery",
                    "Front-end development",
                    "Mobile app design"
                ],
                correct: 1
            },
            {
                question: "Which language is used to write Jenkins Pipeline code?",
                answers: [
                    "Python",
                    "JavaScript",
                    "Groovy",
                    "Ruby"
                ],
                correct: 2
            },
            {
                question: "What is a Jenkinsfile?",
                answers: [
                    "A configuration file for Jenkins installation",
                    "A text file containing Pipeline definition as code",
                    "A log file generated by Jenkins",
                    "A backup file for Jenkins settings"
                ],
                correct: 1
            },
            {
                question: "What is the recommended way to store credentials in Jenkins?",
                answers: [
                    "Hardcode them in the pipeline script",
                    "Store them in a text file in the workspace",
                    "Use Jenkins Credentials Manager",
                    "Keep them in environment variables"
                ],
                correct: 2
            },
            {
                question: "What does the 'agent any' directive mean in a Declarative Pipeline?",
                answers: [
                    "The pipeline will fail",
                    "The pipeline can run on any available agent",
                    "The pipeline requires a specific agent",
                    "The pipeline runs without any agent"
                ],
                correct: 1
            }
        ];

        let currentQuestion = 0;
        let userAnswers = [];
        let score = 0;

        function scrollToSection(sectionId) {
            const section = document.getElementById(sectionId);
            section.scrollIntoView({ behavior: 'smooth' });
            updateActiveNavLink(sectionId);
        }

        function updateActiveNavLink(sectionId) {
            document.querySelectorAll('.nav-link').forEach(link => {
                link.classList.remove('active');
                if (link.getAttribute('href') === `#${sectionId}`) {
                    link.classList.add('active');
                }
            });
        }

        document.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', (e) => {
                e.preventDefault();
                const sectionId = link.getAttribute('href').substring(1);
                scrollToSection(sectionId);
            });
        });

        window.addEventListener('scroll', () => {
            const sections = ['home', 'basics', 'pipeline', 'tips', 'quiz'];
            let current = '';

            sections.forEach(sectionId => {
                const section = document.getElementById(sectionId);
                const sectionTop = section.offsetTop;
                const sectionHeight = section.clientHeight;
                if (pageYOffset >= sectionTop - 200) {
                    current = sectionId;
                }
            });

            updateActiveNavLink(current);
        });

        function showTab(tabName) {
            document.querySelectorAll('.tab-content').forEach(tab => {
                tab.classList.remove('active');
            });

            document.querySelectorAll('.tab-btn').forEach(btn => {
                btn.classList.remove('active');
            });

            document.getElementById(tabName).classList.add('active');
            event.target.classList.add('active');
        }

        function showModal(contentKey) {
            const modal = document.getElementById('modal');
            const modalBody = document.getElementById('modal-body');

            const content = modalContent[contentKey];
            modalBody.innerHTML = `<h2>${content.title}</h2>${content.content}`;

            modal.style.display = 'block';
        }

        function closeModal() {
            const modal = document.getElementById('modal');
            modal.style.display = 'none';
        }

        window.onclick = function(event) {
            const modal = document.getElementById('modal');
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        }

        function loadQuestion() {
            const question = quizData[currentQuestion];
            document.getElementById('question-text').textContent = question.question;
            document.getElementById('question-counter').textContent = `${currentQuestion + 1} / ${quizData.length}`;

            const answersContainer = document.getElementById('answers-container');
            answersContainer.innerHTML = '';

            question.answers.forEach((answer, index) => {
                const answerDiv = document.createElement('div');
                answerDiv.className = 'answer-option';
                answerDiv.textContent = answer;
                answerDiv.onclick = () => selectAnswer(index);

                if (userAnswers[currentQuestion] === index) {
                    answerDiv.classList.add('selected');
                }

                answersContainer.appendChild(answerDiv);
            });
        }

        function selectAnswer(answerIndex) {
            userAnswers[currentQuestion] = answerIndex;

            document.querySelectorAll('.answer-option').forEach((option, index) => {
                option.classList.remove('selected');
                if (index === answerIndex) {
                    option.classList.add('selected');
                }
            });
        }

        function nextQuestion() {
            if (currentQuestion < quizData.length - 1) {
                currentQuestion++;
                loadQuestion();
            } else {
                showResults();
            }
        }

        function previousQuestion() {
            if (currentQuestion > 0) {
                currentQuestion--;
                loadQuestion();
            }
        }

        function showResults() {
            score = 0;
            userAnswers.forEach((answer, index) => {
                if (answer === quizData[index].correct) {
                    score++;
                }
            });

            document.getElementById('quiz-content').classList.add('hidden');
            document.getElementById('quiz-results').classList.remove('hidden');
            document.getElementById('final-score').textContent = score;
        }

        function restartQuiz() {
            currentQuestion = 0;
            userAnswers = [];
            score = 0;

            document.getElementById('quiz-content').classList.remove('hidden');
            document.getElementById('quiz-results').classList.add('hidden');

            loadQuestion();
        }

        document.addEventListener('DOMContentLoaded', () => {
            loadQuestion();
        });
    </script>
</body>
</html>
