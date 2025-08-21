<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In - SecureApp</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        :root {
            --primary: #0ea5e9;
            --primary-dark: #0284c7;
            --secondary: #f1f5f9;
            --accent: #06b6d4;
            --text-primary: #0f172a;
            --text-secondary: #64748b;
            --surface: #ffffff;
            --surface-alt: #f8fafc;
            --border: #e2e8f0;
            --success: #10b981;
            --error: #ef4444;
            --warning: #f59e0b;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #334155 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
            position: relative;
            overflow-x: hidden;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle at 20% 20%, rgba(14, 165, 233, 0.1) 0%, transparent 50%),
                        radial-gradient(circle at 80% 80%, rgba(6, 182, 212, 0.1) 0%, transparent 50%);
            pointer-events: none;
        }

        .login-container {
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 440px;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 3rem;
            position: relative;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        .login-card::before {
            content: '';
            position: absolute;
            inset: 0;
            padding: 1px;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.2) 0%, transparent 50%, rgba(255, 255, 255, 0.1) 100%);
            border-radius: 24px;
            mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
            mask-composite: exclude;
            -webkit-mask-composite: xor;
        }

        .brand-section {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .brand-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, var(--primary), var(--accent));
            border-radius: 16px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
            box-shadow: 0 8px 32px rgba(14, 165, 233, 0.3);
        }

        .brand-icon i {
            color: white;
            font-size: 28px;
        }

        .brand-title {
            font-size: 28px;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
            letter-spacing: -0.025em;
        }

        .brand-subtitle {
            color: var(--text-secondary);
            font-size: 15px;
            font-weight: 400;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 500;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
        }

        .input-wrapper {
            position: relative;
        }

        .form-control {
            width: 100%;
            padding: 0.875rem 1rem 0.875rem 3rem;
            font-size: 15px;
            border: 2px solid var(--border);
            border-radius: 12px;
            background: var(--surface-alt);
            color: var(--text-primary);
            transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            outline: none;
        }

        .form-control:focus {
            border-color: var(--primary);
            background: var(--surface);
            box-shadow: 0 0 0 4px rgba(14, 165, 233, 0.1);
        }

        .form-control.is-invalid {
            border-color: var(--error);
            background: #fef2f2;
        }

        .form-control.is-valid {
            border-color: var(--success);
            background: #f0fdf4;
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-secondary);
            font-size: 18px;
            z-index: 2;
            transition: color 0.2s ease;
        }

        .form-control:focus + .input-icon {
            color: var(--primary);
        }

        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: var(--text-secondary);
            cursor: pointer;
            padding: 0.25rem;
            border-radius: 6px;
            transition: all 0.2s ease;
        }

        .password-toggle:hover {
            color: var(--text-primary);
            background: var(--secondary);
        }

        .form-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .form-check {
            display: flex;
            align-items: center;
        }

        .form-check-input {
            width: 18px;
            height: 18px;
            margin-right: 0.5rem;
            accent-color: var(--primary);
        }

        .form-check-label {
            font-size: 14px;
            color: var(--text-secondary);
            cursor: pointer;
        }

        .forgot-link {
            font-size: 14px;
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s ease;
        }

        .forgot-link:hover {
            color: var(--primary-dark);
        }

        .btn-primary {
            width: 100%;
            padding: 0.875rem 1.5rem;
            font-size: 16px;
            font-weight: 600;
            background: linear-gradient(135deg, var(--primary), var(--accent));
            border: none;
            border-radius: 12px;
            color: white;
            cursor: pointer;
            transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

        .btn-primary:hover:not(:disabled) {
            transform: translateY(-1px);
            box-shadow: 0 8px 32px rgba(14, 165, 233, 0.3);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        .btn-primary:disabled {
            opacity: 0.7;
            cursor: not-allowed;
        }

        .btn-spinner {
            display: none;
            width: 20px;
            height: 20px;
            border: 2px solid transparent;
            border-top: 2px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin-right: 0.5rem;
        }

        .btn-primary.loading .btn-spinner {
            display: inline-block;
        }

        .btn-primary.loading .btn-text {
            opacity: 0.7;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .alert {
            padding: 1rem;
            border-radius: 12px;
            margin-bottom: 1.5rem;
            border: none;
            font-size: 14px;
            display: flex;
            align-items: center;
            animation: slideIn 0.3s ease-out;
        }

        .alert-danger {
            background: linear-gradient(135deg, #fef2f2, #fee2e2);
            color: var(--error);
            border-left: 4px solid var(--error);
        }

        .alert-success {
            background: linear-gradient(135deg, #f0fdf4, #dcfce7);
            color: var(--success);
            border-left: 4px solid var(--success);
        }

        .alert i {
            margin-right: 0.5rem;
            font-size: 16px;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 1.5rem 0;
            color: var(--text-secondary);
            font-size: 14px;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: var(--border);
        }

        .divider span {
            padding: 0 1rem;
            background: var(--surface);
        }

        .register-link {
            text-align: center;
            color: var(--text-secondary);
            font-size: 14px;
        }

        .register-link a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
        }

        .register-link a:hover {
            color: var(--primary-dark);
        }

        @media (max-width: 576px) {
            body {
                padding: 1rem 0.5rem;
            }
            
            .login-card {
                padding: 2rem 1.5rem;
            }
            
            .brand-title {
                font-size: 24px;
            }
            
            .form-options {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }
        }

        /* Accessibility improvements */
        @media (prefers-reduced-motion: reduce) {
            * {
                animation-duration: 0.01ms !important;
                animation-iteration-count: 1 !important;
                transition-duration: 0.01ms !important;
            }
        }

        .visually-hidden {
            position: absolute !important;
            width: 1px !important;
            height: 1px !important;
            padding: 0 !important;
            margin: -1px !important;
            overflow: hidden !important;
            clip: rect(0, 0, 0, 0) !important;
            white-space: nowrap !important;
            border: 0 !important;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <div class="brand-section">
                <div class="brand-icon">
                    <i class="bi bi-shield-check"></i>
                </div>
                <h1 class="brand-title">Welcome back</h1>
                <p class="brand-subtitle">Sign in to your account to continue</p>
            </div>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                    <i class="bi bi-exclamation-circle"></i>
                    <c:out value="${error}" escapeXml="true"/>
                </div>
            </c:if>

            <!-- Success Message -->
            <c:if test="${not empty success}">
                <div class="alert alert-success" role="alert">
                    <i class="bi bi-check-circle"></i>
                    <c:out value="${success}" escapeXml="true"/>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/login" method="post" id="loginForm" novalidate>
                <!-- CSRF Token -->
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                
                <!-- Username Field -->
                <div class="form-group">
                    <label for="username" class="form-label">Username</label>
                    <div class="input-wrapper">
                        <input type="text" 
                               class="form-control" 
                               id="username" 
                               name="username" 
                               value="${param.username}"
                               required 
                               autocomplete="username"
                               aria-describedby="usernameHelp">
                        <i class="bi bi-person input-icon"></i>
                    </div>
                </div>

                <!-- Password Field -->
                <div class="form-group">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-wrapper">
                        <input type="password" 
                               class="form-control" 
                               id="password" 
                               name="password" 
                               required 
                               autocomplete="current-password"
                               aria-describedby="passwordHelp">
                        <i class="bi bi-lock input-icon"></i>
                        <button type="button" class="password-toggle" id="togglePassword" aria-label="Toggle password visibility">
                            <i class="bi bi-eye"></i>
                        </button>
                    </div>
                </div>

                <!-- Form Options -->
                <div class="form-options">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                        <label class="form-check-label" for="rememberMe">
                            Remember me
                        </label>
                    </div>
                    <a href="${pageContext.request.contextPath}/forgot-password" class="forgot-link">
                        Forgot password?
                    </a>
                </div>

                <!-- Login Button -->
                <button type="submit" class="btn-primary" id="loginBtn">
                    <div class="btn-spinner"></div>
                    <span class="btn-text">
                        <i class="bi bi-arrow-right me-2"></i>Sign in
                    </span>
                </button>
            </form>

            <div class="divider">
                <span>New to SecureApp?</span>
            </div>

            <div class="register-link">
                Don't have an account? <a href="${pageContext.request.contextPath}/register">Create account</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const loginForm = document.getElementById('loginForm');
            const loginBtn = document.getElementById('loginBtn');
            const usernameInput = document.getElementById('username');
            const passwordInput = document.getElementById('password');
            const togglePassword = document.getElementById('togglePassword');

            // Password visibility toggle
            togglePassword.addEventListener('click', function() {
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                
                const icon = this.querySelector('i');
                icon.className = type === 'password' ? 'bi bi-eye' : 'bi bi-eye-slash';
            });

            // Form validation
            function validateForm() {
                let isValid = true;
                
                // Clear previous validation states
                [usernameInput, passwordInput].forEach(input => {
                    input.classList.remove('is-invalid', 'is-valid');
                });

                // Validate username
                if (!usernameInput.value.trim()) {
                    usernameInput.classList.add('is-invalid');
                    isValid = false;
                } else {
                    usernameInput.classList.add('is-valid');
                }

                // Validate password
                if (!passwordInput.value || passwordInput.value.length < 3) {
                    passwordInput.classList.add('is-invalid');
                    isValid = false;
                } else {
                    passwordInput.classList.add('is-valid');
                }

                return isValid;
            }

            // Form submission
            loginForm.addEventListener('submit', function(e) {
                e.preventDefault();
                
                if (!validateForm()) {
                    return;
                }

                // Show loading state
                loginBtn.classList.add('loading');
                loginBtn.disabled = true;

                // Submit form after a brief delay
                setTimeout(() => {
                    loginForm.submit();
                }, 600);
            });

            // Real-time validation
            [usernameInput, passwordInput].forEach(input => {
                input.addEventListener('input', function() {
                    if (this.classList.contains('is-invalid') || this.classList.contains('is-valid')) {
                        validateForm();
                    }
                });

                input.addEventListener('blur', function() {
                    validateForm();
                });
            });

            // Focus management
            if (usernameInput.value) {
                passwordInput.focus();
            } else {
                usernameInput.focus();
            }

            // Handle Enter key
            [usernameInput, passwordInput].forEach(input => {
                input.addEventListener('keypress', function(e) {
                    if (e.key === 'Enter') {
                        loginForm.dispatchEvent(new Event('submit'));
                    }
                });
            });

            // Auto-dismiss alerts
            document.querySelectorAll('.alert').forEach(alert => {
                setTimeout(() => {
                    alert.style.opacity = '0';
                    alert.style.transform = 'translateY(-10px)';
                    setTimeout(() => alert.remove(), 300);
                }, 5000);
            });
        });
    </script>
</body>
</html>