<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
    
    .modern-navbar {
        background: rgba(15, 23, 42, 0.95);
        backdrop-filter: blur(20px);
        -webkit-backdrop-filter: blur(20px);
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.12);
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        padding: 1rem 2rem;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 1000;
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
    }

    .modern-navbar .navbar-brand {
        font-weight: 700;
        font-size: 1.5rem;
        color: white !important;
        text-decoration: none;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        display: flex;
        align-items: center;
        letter-spacing: -0.025em;
    }

    .modern-navbar .navbar-brand::before {
        content: '';
        width: 32px;
        height: 32px;
        background: linear-gradient(135deg, #0ea5e9, #06b6d4);
        border-radius: 8px;
        margin-right: 0.75rem;
        box-shadow: 0 4px 16px rgba(14, 165, 233, 0.3);
        transition: all 0.3s ease;
    }

    .modern-navbar .navbar-brand:hover {
        transform: translateY(-1px);
        color: white !important;
        text-decoration: none;
    }

    .modern-navbar .navbar-brand:hover::before {
        transform: scale(1.1);
        box-shadow: 0 6px 20px rgba(14, 165, 233, 0.4);
    }

    .modern-navbar .navbar-toggler {
        border: 2px solid rgba(255, 255, 255, 0.15);
        border-radius: 12px;
        padding: 0.5rem;
        transition: all 0.3s ease;
        background: rgba(255, 255, 255, 0.05);
    }

    .modern-navbar .navbar-toggler:hover {
        border-color: rgba(255, 255, 255, 0.3);
        background: rgba(255, 255, 255, 0.1);
        transform: translateY(-1px);
    }

    .modern-navbar .navbar-toggler:focus {
        box-shadow: 0 0 0 3px rgba(14, 165, 233, 0.2);
        outline: none;
    }

    .modern-navbar .navbar-toggler-icon {
        background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%28255, 255, 255, 0.9%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        width: 24px;
        height: 24px;
    }

    .modern-navbar .nav-link {
        color: rgba(255, 255, 255, 0.8) !important;
        font-weight: 500;
        font-size: 15px;
        padding: 0.75rem 1.25rem !important;
        border-radius: 12px;
        margin: 0 0.25rem;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        position: relative;
        overflow: hidden;
        text-decoration: none;
    }

    .modern-navbar .nav-link::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: linear-gradient(135deg, #0ea5e9, #06b6d4);
        opacity: 0;
        transform: scale(0.8);
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        z-index: -1;
        border-radius: 12px;
    }

    .modern-navbar .nav-link:hover {
        color: white !important;
        transform: translateY(-2px);
        text-decoration: none;
    }

    .modern-navbar .nav-link:hover::before {
        opacity: 1;
        transform: scale(1);
    }

    .modern-navbar .nav-item.active .nav-link {
        color: white !important;
        background: rgba(14, 165, 233, 0.15);
        border: 1px solid rgba(14, 165, 233, 0.3);
    }

    .modern-navbar .nav-item.active .nav-link::before {
        opacity: 0.1;
        transform: scale(1);
    }

    /* Special styling for user welcome message */
    .modern-navbar .nav-link[href="#"] {
        color: rgba(255, 255, 255, 0.9) !important;
        background: rgba(255, 255, 255, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.15);
        border-radius: 25px;
        font-size: 14px;
        cursor: default;
    }

    .modern-navbar .nav-link[href="#"]:hover {
        transform: none;
        background: rgba(255, 255, 255, 0.1);
    }

    .modern-navbar .nav-link[href="#"]::before {
        content: '👋 ';
        position: static;
        background: none;
        margin-right: 0.5rem;
        opacity: 1;
        transform: none;
    }

    /* Special styling for logout button */
    .modern-navbar .nav-link[href="logout"] {
        background: linear-gradient(135deg, #ef4444, #dc2626) !important;
        color: white !important;
        font-weight: 500;
        border: none;
    }

    .modern-navbar .nav-link[href="logout"]:hover {
        background: linear-gradient(135deg, #dc2626, #b91c1c) !important;
        box-shadow: 0 4px 16px rgba(239, 68, 68, 0.3);
        color: white !important;
    }

    .modern-navbar .nav-link[href="logout"]::before {
        background: none;
        content: '🚪 ';
        position: static;
        margin-right: 0.5rem;
        opacity: 1;
        transform: none;
    }

    /* Special styling for login button */
    .modern-navbar .nav-link[href="login"] {
        background: linear-gradient(135deg, #0ea5e9, #06b6d4) !important;
        color: white !important;
        font-weight: 600;
        border: none;
    }

    .modern-navbar .nav-link[href="login"]:hover {
        background: linear-gradient(135deg, #0284c7, #0ea5e9) !important;
        box-shadow: 0 4px 16px rgba(14, 165, 233, 0.3);
        color: white !important;
    }

    .modern-navbar .nav-link[href="login"]::before {
        background: none;
        content: '🔐 ';
        position: static;
        margin-right: 0.5rem;
        opacity: 1;
        transform: none;
    }

    /* Mobile responsiveness */
    @media (max-width: 991.98px) {
        .modern-navbar {
            padding: 1rem;
        }

        .modern-navbar .navbar-collapse {
            background: rgba(15, 23, 42, 0.98);
            border-radius: 16px;
            margin-top: 1rem;
            padding: 1.5rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
        }

        .modern-navbar .nav-link {
            margin: 0.25rem 0;
            text-align: center;
        }

        .modern-navbar .navbar-nav.ml-auto {
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }
    }

    @media (max-width: 576px) {
        .modern-navbar .navbar-brand {
            font-size: 1.25rem;
        }

        .modern-navbar .navbar-brand::before {
            width: 28px;
            height: 28px;
            margin-right: 0.5rem;
        }
    }

    /* Add padding to body to account for fixed navbar */
    body {
        padding-top: 80px;
    }
</style>

<!-- Bootstrap Icons (if not already included) -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">

<nav class="navbar navbar-expand-lg modern-navbar">
    <a class="navbar-brand" href="product?action=list">Pahana Edu</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="item?action=list">Manage Items</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="customer?action=list">Manage Customers</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="bill?action=list">Billing</a>
            </li>
           
        </ul>

        <ul class="navbar-nav ml-auto">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Hello, ${sessionScope.user.username}</a>
                    </li>
                     <li class="nav-item">
					    <a class="nav-link" href="help.jsp">Help</a>
					</li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link" href="login">Login</a>
                    </li>
                    
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Active link detection based on current URL
    const currentPath = window.location.pathname + window.location.search;
    const navLinks = document.querySelectorAll('.nav-link');
    
    navLinks.forEach(link => {
        if (link.getAttribute('href') && currentPath.includes(link.getAttribute('href'))) {
            link.closest('.nav-item').classList.add('active');
        }
    });
    
    // Enhanced mobile menu behavior for Bootstrap 4
    const navbarToggler = document.querySelector('.navbar-toggler');
    const navbarCollapse = document.getElementById('navbarNav');
    
    if (navbarToggler && navbarCollapse) {
        navbarToggler.addEventListener('click', function() {
            const isExpanded = this.getAttribute('aria-expanded') === 'true';
            this.style.transform = isExpanded ? 'rotate(0deg)' : 'rotate(90deg)';
        });
        
        // Close mobile menu when clicking a nav link
        navLinks.forEach(link => {
            link.addEventListener('click', function() {
                if (window.innerWidth < 992) {
                    // For Bootstrap 4, we need to manually trigger the collapse
                    if (typeof $ !== 'undefined' && $.fn.collapse) {
                        $('#navbarNav').collapse('hide');
                    } else {
                        navbarCollapse.classList.remove('show');
                    }
                }
            });
        });
    }
});
</script>